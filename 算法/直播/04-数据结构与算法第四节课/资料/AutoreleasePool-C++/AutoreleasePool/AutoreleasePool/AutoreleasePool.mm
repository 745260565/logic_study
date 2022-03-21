//
//  AutoreleasePool.hpp
//  AutoreleasePool
//
//  Created by ws on 2021/12/30.
//
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdarg.h>
#include <string.h>
#include <assert.h>
#include <Availability.h>
#include <unistd.h>
#include <sys/stat.h>
#include <malloc/malloc.h>
#include <stdint.h>
#include <stdbool.h>
#include <mach/mach.h>
#include <mach-o/dyld.h>
#include <mach-o/nlist.h>
#include <sys/types.h>
#include <sys/mman.h>
#include <Block.h>
#include <map>
#include <pthread.h>
#include <execinfo.h>
#include "NSObject-internal.h"
#include <_simple.h>
#include <reason.h>
#include <tsd.h>
#include <dyld_priv.h>
#include <System/pthread_machdep.h>
#include <AutoreleasePool.h>


/***********************************************************************
   Autorelease pool implementation

   A thread's autorelease pool is a stack of pointers.
   Each pointer is either an object to release, or POOL_BOUNDARY which is
     an autorelease pool boundary.
   A pool token is a pointer to the POOL_BOUNDARY for that pool. When
     the pool is popped, every object hotter than the sentinel is released.
   The stack is divided into a doubly-linked list of pages. Pages are added
     and deleted as necessary.
   Thread-local storage points to the hot page, where newly autoreleased
     objects are stored.
**********************************************************************/

/* Use this for functions that are intended to be breakpoint hooks.
   If you do not, the compiler may optimize them away.
   BREAKPOINT_FUNCTION( void stop_on_error(void) ); */

#define ASL_LEVEL_ERR     3
#define OBJC_EXIT_REASON_UNSPECIFIED 1

#define sdkIsOlderThan(x, i, t, w, b)                           \
            (sdkVersion() < DYLD_OS_VERSION(x, i, t, w, b))
#define sdkIsAtLeast(x, i, t, w, b)                             \
            (sdkVersion() >= DYLD_OS_VERSION(x, i, t, w, b))
#define fastpath(x) (__builtin_expect(bool(x), 1))
#define slowpath(x) (__builtin_expect(bool(x), 0))
#define SDK_FORMAT "%hu.%hhu.%hhu"
#define FORMAT_SDK(v) \
    (unsigned short)(((uint32_t)(v))>>16),  \
    (unsigned  char)(((uint32_t)(v))>>8),   \
    (unsigned  char)(((uint32_t)(v))>>0)
#if TARGET_OS_OSX
#   define DYLD_OS_VERSION(x, i, t, w, b) DYLD_MACOSX_VERSION_##x
#   define sdkVersion() dyld_get_program_sdk_version()

#elif TARGET_OS_IOS
#   define DYLD_OS_VERSION(x, i, t, w, b) DYLD_IOS_VERSION_##i
#   define sdkVersion() dyld_get_program_sdk_version()

#elif TARGET_OS_TV
    // dyld does not currently have distinct constants for tvOS
#   define DYLD_OS_VERSION(x, i, t, w, b) DYLD_IOS_VERSION_##t
#   define sdkVersion() dyld_get_program_sdk_version()

#elif TARGET_OS_BRIDGE
#   if TARGET_OS_WATCH
#       error bridgeOS 1.0 not supported
#   endif
    // fixme don't need bridgeOS versioning yet
#   define DYLD_OS_VERSION(x, i, t, w, b) DYLD_IOS_VERSION_##t
#   define sdkVersion() dyld_get_program_sdk_bridge_os_version()

#elif TARGET_OS_WATCH
#   define DYLD_OS_VERSION(x, i, t, w, b) DYLD_WATCHOS_VERSION_##w
    // watchOS has its own API for compatibility reasons
#   define sdkVersion() dyld_get_program_sdk_watch_os_version()

#else
#   error unknown OS
#endif

// Thread keys reserved by libc for our use.
#if defined(__PTK_FRAMEWORK_OBJC_KEY0)
#   define SUPPORT_DIRECT_THREAD_KEYS 1
#   define TLS_DIRECT_KEY        ((tls_key_t)__PTK_FRAMEWORK_OBJC_KEY0)
#   define SYNC_DATA_DIRECT_KEY  ((tls_key_t)__PTK_FRAMEWORK_OBJC_KEY1)
#   define SYNC_COUNT_DIRECT_KEY ((tls_key_t)__PTK_FRAMEWORK_OBJC_KEY2)
#   define AUTORELEASE_POOL_KEY  ((tls_key_t)__PTK_FRAMEWORK_OBJC_KEY3)
# if SUPPORT_RETURN_AUTORELEASE
#   define RETURN_DISPOSITION_KEY ((tls_key_t)__PTK_FRAMEWORK_OBJC_KEY4)
# endif
#else
#   define SUPPORT_DIRECT_THREAD_KEYS 0
#endif

__header_always_inline int
_pthread_has_direct_tsd(void)
{
#if TARGET_IPHONE_SIMULATOR
    return 0;
#else
    return 1;
#endif
}
typedef pthread_key_t tls_key_t;

#   define BREAKPOINT_FUNCTION(prototype)                             \
    OBJC_EXTERN __attribute__((noinline, used, visibility("hidden"))) \
    prototype { asm(""); }

#   define AUTORELEASE_POOL_KEY  ((tls_key_t)__PTK_FRAMEWORK_OBJC_KEY3)

BREAKPOINT_FUNCTION(
    void objc_overrelease_during_dealloc_error(void)
);

BREAKPOINT_FUNCTION(void objc_autoreleaseNoPool(id obj));
BREAKPOINT_FUNCTION(void objc_autoreleasePoolInvalid(const void *token));

#define OPTION(var, env, help) extern bool var;
OPTION( DebugDontCrash,           OBJC_DEBUG_DONT_CRASH,           "halt the process by exiting instead of crashing")
OPTION( DebugMissingPools,        OBJC_DEBUG_MISSING_POOLS,        "warn about autorelease with no pool in place, which may be a leak")
OPTION( DebugPoolAllocation,      OBJC_DEBUG_POOL_ALLOCATION,      "halt when autorelease pools are popped out of order, and allow heap debuggers to track autorelease pools")
OPTION( PrintPoolHiwat,           OBJC_PRINT_POOL_HIGHWATER,       "log high-water marks for autorelease pools")
#undef OPTION

bool DebugDontCrash = 0;
bool DebugMissingPools = 0;
bool DebugPoolAllocation = 0;
bool PrintPoolHiwat = 0;


__attribute__((const))
static inline pthread_t objc_thread_self()
{
    return pthread_self();
}
static inline bool is_valid_direct_key(tls_key_t k) {
    return (   k == SYNC_DATA_DIRECT_KEY
            || k == SYNC_COUNT_DIRECT_KEY
            || k == AUTORELEASE_POOL_KEY
            || k == _PTHREAD_TSD_SLOT_PTHREAD_SELF
#   if SUPPORT_RETURN_AUTORELEASE
            || k == RETURN_DISPOSITION_KEY
#   endif
               );
}
/* To be used with static constant keys only */
__header_always_inline void *
_pthread_getspecific_direct(unsigned long slot)
{
#if TARGET_IPHONE_SIMULATOR
    return pthread_getspecific(slot);
#else
    return _os_tsd_get_direct(slot);
#endif
}
/* To be used with static constant keys only, assumes destructor is
 * already setup (with pthread_key_init_np) */
__header_always_inline int
_pthread_setspecific_direct(unsigned long slot, void * val)
{
#if TARGET_IPHONE_SIMULATOR
    return _pthread_setspecific_static(slot, val);
#else
    return _os_tsd_set_direct(slot, val);
#endif
}
static inline void *tls_get_direct(tls_key_t k)
{
//    ASSERT(is_valid_direct_key(k));

    if (_pthread_has_direct_tsd()) {
        return _pthread_getspecific_direct(k);
    } else {
        return pthread_getspecific(k);
    }
}

static inline void tls_set_direct(tls_key_t k, void *value)
{
//    ASSERT(is_valid_direct_key(k));

    if (_pthread_has_direct_tsd()) {
        _pthread_setspecific_direct(k, value);
    } else {
        pthread_setspecific(k, value);
    }
}

extern void _objc_fatal(const char *fmt, ...)
    __attribute__((noreturn, cold, format (printf, 1, 2)));
extern void _objc_fatal_with_reason(uint64_t reason, uint64_t flags,
                                    const char *fmt, ...)
    __attribute__((noreturn, cold, format (printf, 3, 4)));



// Returns true if logs should be sent to stderr as well as syslog.
// Copied from CFUtilities.c
static bool also_do_stderr(void)
{
    struct stat st;
    int ret = fstat(STDERR_FILENO, &st);
    if (ret < 0) return false;
    mode_t m = st.st_mode & S_IFMT;
    if (m == S_IFREG  ||  m == S_IFSOCK  ||  m == S_IFIFO  ||  m == S_IFCHR) {
        return true;
    }
    return false;
}



// Print "message" to the console.
static void _objc_syslog(const char *message)
{
    _simple_asl_log(ASL_LEVEL_ERR, nil, message);

    if (also_do_stderr()) {
        write(STDERR_FILENO, message, strlen(message));
    }
}

__attribute__((noreturn, cold))
void _objc_error(id self, const char *fmt, va_list ap)
{
    char *buf;
    vasprintf(&buf, fmt, ap);
    _objc_fatal("%s: %s", object_getClassName(self), buf);
}

static __attribute__((noreturn, cold))
void _objc_fatalv(uint64_t reason, uint64_t flags, const char *fmt, va_list ap)
{
    char *buf1;
    vasprintf(&buf1, fmt, ap);

    char *buf2;
    asprintf(&buf2, "objc[%d]: %s\n", getpid(), buf1);
    _objc_syslog(buf2);

    if (DebugDontCrash) {
        char *buf3;
        asprintf(&buf3, "objc[%d]: HALTED\n", getpid());
        _objc_syslog(buf3);
        _Exit(1);
    }
    else {
//        _objc_crashlog(buf1);
        abort_with_reason(OS_REASON_OBJC, reason, buf1, flags);
    }
}

void _objc_fatal_with_reason(uint64_t reason, uint64_t flags,
                             const char *fmt, ...)
{
    va_list ap;
    va_start(ap, fmt);
    _objc_fatalv(reason, flags, fmt, ap);
}

void _objc_fatal(const char *fmt, ...)
{
    va_list ap;
    va_start(ap,fmt);
    _objc_fatalv(OBJC_EXIT_REASON_UNSPECIFIED,
                 OS_REASON_FLAG_ONE_TIME_FAILURE,
                 fmt, ap);
}
/*
 * Like calling both _objc_inform and _objc_inform_on_crash.
 */
void _objc_inform_now_and_on_crash(const char *fmt, ...)
{
    va_list ap;
    char *buf1;
    char *buf2;

    va_start (ap,fmt);
    vasprintf(&buf1, fmt, ap);
    va_end (ap);

    asprintf(&buf2, "objc[%d]: %s\n", getpid(), buf1);
//    _objc_crashlog(buf2);
    _objc_syslog(buf2);

    free(buf2);
    free(buf1);
}

/*
 * this routine handles soft runtime errors...like not being able
 * add a category to a class (because it wasn't linked in).
 */
void _objc_inform(const char *fmt, ...)
{
    va_list ap;
    char *buf1;
    char *buf2;

    va_start (ap,fmt);
    vasprintf(&buf1, fmt, ap);
    va_end (ap);

    asprintf(&buf2, "objc[%d]: %s\n", getpid(), buf1);
    _objc_syslog(buf2);

    free(buf2);
    free(buf1);
}

void
objc_release(id _Nullable obj)
    __asm__("_objc_release");

class AutoreleasePoolPage : private AutoreleasePoolPageData
{
    friend struct thread_data_t;

public:
    static size_t const SIZE =
#if PROTECT_AUTORELEASEPOOL
        PAGE_MAX_SIZE;  // must be multiple of vm page size
#else
        PAGE_MIN_SIZE;  // size and alignment, power of 2
#endif
    
private:
    static pthread_key_t const key = 38;
    static uint8_t const SCRIBBLE = 0xA3;  // 0xA3A3A3A3 after releasing
    static size_t const COUNT = SIZE / sizeof(id);

    // EMPTY_POOL_PLACEHOLDER is stored in TLS when exactly one pool is
    // pushed and it has never contained any objects. This saves memory
    // when the top level (i.e. libdispatch) pushes and pops pools but
    // never uses them.
#   define EMPTY_POOL_PLACEHOLDER ((id*)1)

#   define POOL_BOUNDARY nil

    // SIZE-sizeof(*this) bytes of contents follow

    static void * operator new(size_t size) {
        return malloc_zone_memalign(malloc_default_zone(), SIZE, SIZE);
    }
    static void operator delete(void * p) {
        return free(p);
    }

    inline void protect() {
#if PROTECT_AUTORELEASEPOOL
        mprotect(this, SIZE, PROT_READ);
        check();
#endif
    }

    inline void unprotect() {
#if PROTECT_AUTORELEASEPOOL
        check();
        mprotect(this, SIZE, PROT_READ | PROT_WRITE);
#endif
    }

    AutoreleasePoolPage(AutoreleasePoolPage *newParent) :
        AutoreleasePoolPageData(begin(),
                                objc_thread_self(),
                                newParent,
                                newParent ? 1+newParent->depth : 0,
                                newParent ? newParent->hiwat : 0)
    {
        if (parent) {
            parent->check();
            ASSERT(!parent->child);
            parent->unprotect();
            parent->child = this;
            parent->protect();
        }
        protect();
    }

    ~AutoreleasePoolPage()
    {
        check();
        unprotect();
        ASSERT(empty());

        // Not recursive: we don't want to blow out the stack
        // if a thread accumulates a stupendous amount of garbage
        ASSERT(!child);
    }

    template<typename Fn>
    void
    busted(Fn log) const
    {
        magic_t right;
        log("autorelease pool page %p corrupted\n"
             "  magic     0x%08x 0x%08x 0x%08x 0x%08x\n"
             "  should be 0x%08x 0x%08x 0x%08x 0x%08x\n"
             "  pthread   %p\n"
             "  should be %p\n",
             this,
             magic.m[0], magic.m[1], magic.m[2], magic.m[3],
             right.m[0], right.m[1], right.m[2], right.m[3],
             this->thread, objc_thread_self());
    }

    __attribute__((noinline, cold, noreturn))
    void
    busted_die() const
    {
        busted(_objc_fatal);
        __builtin_unreachable();
    }

    inline void
    check(bool die = true) const
    {
        if (!magic.check() || thread != objc_thread_self()) {
            if (die) {
                busted_die();
            } else {
                busted(_objc_inform);
            }
        }
    }

    inline void
    fastcheck() const
    {
#if CHECK_AUTORELEASEPOOL
        check();
#else
        if (! magic.fastcheck()) {
            busted_die();
        }
#endif
    }


    id * begin() {
        return (id *) ((uint8_t *)this+sizeof(*this));
    }

    id * end() {
        return (id *) ((uint8_t *)this+SIZE);
    }

    bool empty() {
        return next == begin();
    }

    bool full() {
        return next == end();
    }

    bool lessThanHalfFull() {
        return (next - begin() < (end() - begin()) / 2);
    }

    id *add(id obj)
    {
        printf("%p----\n", this);
        ASSERT(!full());
        unprotect();
        id *ret = next;  // faster than `return next-1` because of aliasing
        *next++ = obj;
        protect();
        return ret;
    }

    void releaseAll()
    {
        releaseUntil(begin());
    }

    void releaseUntil(id *stop)
    {
        // Not recursive: we don't want to blow out the stack
        // if a thread accumulates a stupendous amount of garbage
        
        while (this->next != stop) {
            // Restart from hotPage() every time, in case -release
            // autoreleased more objects
            AutoreleasePoolPage *page = hotPage();

            // fixme I think this `while` can be `if`, but I can't prove it
            while (page->empty()) {
                page = page->parent;
                setHotPage(page);
            }

            page->unprotect();
            id obj = *--page->next;
            memset((void*)page->next, SCRIBBLE, sizeof(*page->next));
            page->protect();

            if (obj != POOL_BOUNDARY) {
                objc_release(obj);
            }
        }

        setHotPage(this);

#if DEBUG
        // we expect any children to be completely empty
        for (AutoreleasePoolPage *page = child; page; page = page->child) {
            ASSERT(page->empty());
        }
#endif
    }

    void kill()
    {
        // Not recursive: we don't want to blow out the stack
        // if a thread accumulates a stupendous amount of garbage
        AutoreleasePoolPage *page = this;
        while (page->child) page = page->child;

        AutoreleasePoolPage *deathptr;
        do {
            deathptr = page;
            page = page->parent;
            if (page) {
                page->unprotect();
                page->child = nil;
                page->protect();
            }
            delete deathptr;
        } while (deathptr != this);
    }

    static void tls_dealloc(void *p)
    {
        if (p == (void*)EMPTY_POOL_PLACEHOLDER) {
            // No objects or pool pages to clean up here.
            return;
        }

        // reinstate TLS value while we work
        setHotPage((AutoreleasePoolPage *)p);

        if (AutoreleasePoolPage *page = coldPage()) {
            if (!page->empty()) objc_autoreleasePoolPop(page->begin());  // pop all of the pools
            if (slowpath(DebugMissingPools || DebugPoolAllocation)) {
                // pop() killed the pages already
            } else {
                page->kill();  // free all of the pages
            }
        }
        
        // clear TLS value so TLS destruction doesn't loop
        setHotPage(nil);
    }

    static AutoreleasePoolPage *pageForPointer(const void *p)
    {
        return pageForPointer((uintptr_t)p);
    }

    static AutoreleasePoolPage *pageForPointer(uintptr_t p)
    { 
        AutoreleasePoolPage *result;
        uintptr_t offset = p % SIZE;

        ASSERT(offset >= sizeof(AutoreleasePoolPage));

        result = (AutoreleasePoolPage *)(p - offset);
        result->fastcheck();

        return result;
    }


    static inline bool haveEmptyPoolPlaceholder()
    {
        id *tls = (id *)tls_get_direct(key);
        return (tls == EMPTY_POOL_PLACEHOLDER);
    }

    static inline id* setEmptyPoolPlaceholder()
    {
        ASSERT(tls_get_direct(key) == nil);
        tls_set_direct(key, (void *)EMPTY_POOL_PLACEHOLDER);
        return EMPTY_POOL_PLACEHOLDER;
    }

    static inline AutoreleasePoolPage *hotPage()
    {
        AutoreleasePoolPage *result = (AutoreleasePoolPage *)
            tls_get_direct(key);
        if ((id *)result == EMPTY_POOL_PLACEHOLDER) return nil;
        if (result) result->fastcheck();
        return result;
    }

    static inline void setHotPage(AutoreleasePoolPage *page)
    {
        if (page) page->fastcheck();
        tls_set_direct(key, (void *)page);
    }

    static inline AutoreleasePoolPage *coldPage()
    {
        AutoreleasePoolPage *result = hotPage();
        if (result) {
            while (result->parent) {
                result = result->parent;
                result->fastcheck();
            }
        }
        return result;
    }


    static inline id *autoreleaseFast(id obj)
    {
        AutoreleasePoolPage *page = hotPage();
        if (page && !page->full()) {
            return page->add(obj);
        } else if (page) {
            return autoreleaseFullPage(obj, page);
        } else {
            return autoreleaseNoPage(obj);
        }
    }

    static __attribute__((noinline))
    id *autoreleaseFullPage(id obj, AutoreleasePoolPage *page)
    {
        // The hot page is full.
        // Step to the next non-full page, adding a new page if necessary.
        // Then add the object to that page.
        ASSERT(page == hotPage());
        ASSERT(page->full()  ||  DebugPoolAllocation);

        do {
            if (page->child) page = page->child;
            else page = new AutoreleasePoolPage(page);
        } while (page->full());

        setHotPage(page);
        return page->add(obj);
    }

    static __attribute__((noinline))
    id *autoreleaseNoPage(id obj)
    {
        // "No page" could mean no pool has been pushed
        // or an empty placeholder pool has been pushed and has no contents yet
        ASSERT(!hotPage());

        bool pushExtraBoundary = false;
        if (haveEmptyPoolPlaceholder()) {
            // We are pushing a second pool over the empty placeholder pool
            // or pushing the first object into the empty placeholder pool.
            // Before doing that, push a pool boundary on behalf of the pool
            // that is currently represented by the empty placeholder.
            pushExtraBoundary = true;
        }
        else if (obj != POOL_BOUNDARY  &&  DebugMissingPools) {
            // We are pushing an object with no pool in place,
            // and no-pool debugging was requested by environment.
            _objc_inform("MISSING POOLS: (%p) Object %p of class %s "
                         "autoreleased with no pool in place - "
                         "just leaking - break on "
                         "objc_autoreleaseNoPool() to debug",
                         objc_thread_self(), (void*)obj, object_getClassName(obj));
            objc_autoreleaseNoPool(obj);
            return nil;
        }
        else if (obj == POOL_BOUNDARY  &&  !DebugPoolAllocation) {
            // We are pushing a pool with no pool in place,
            // and alloc-per-pool debugging was not requested.
            // Install and return the empty pool placeholder.
            return setEmptyPoolPlaceholder();
        }

        // We are pushing an object or a non-placeholder'd pool.

        // Install the first page.
        AutoreleasePoolPage *page = new AutoreleasePoolPage(nil);
        setHotPage(page);
        
        // Push a boundary on behalf of the previously-placeholder'd pool.
        if (pushExtraBoundary) {
            page->add(POOL_BOUNDARY);
        }
        
        // Push the requested object or pool.
        return page->add(obj);
    }


    static __attribute__((noinline))
    id *autoreleaseNewPage(id obj)
    {
        AutoreleasePoolPage *page = hotPage();
        if (page) return autoreleaseFullPage(obj, page);
        else return autoreleaseNoPage(obj);
    }

public:
    static inline id autorelease(id obj)
    {
        ASSERT(obj);
//        ASSERT(!obj->isTaggedPointer());
        id *dest __unused = autoreleaseFast(obj);
        ASSERT(!dest  ||  dest == EMPTY_POOL_PLACEHOLDER  ||  *dest == obj);
        printf("%p\n", dest);

        return obj;
    }


    static inline void *push()
    {
        id *dest;
        if (slowpath(DebugPoolAllocation)) {
            // Each autorelease pool starts on a new pool page.
            dest = autoreleaseNewPage(POOL_BOUNDARY);
        } else {
            dest = autoreleaseFast(POOL_BOUNDARY);
        }
        ASSERT(dest == EMPTY_POOL_PLACEHOLDER || *dest == POOL_BOUNDARY);
        printf("%p\n", dest);

        return dest;
    }

    __attribute__((noinline, cold))
    static void badPop(void *token)
    {
        // Error. For bincompat purposes this is not
        // fatal in executables built with old SDKs.

        if (DebugPoolAllocation || sdkIsAtLeast(10_12, 10_0, 10_0, 3_0, 2_0)) {
            // OBJC_DEBUG_POOL_ALLOCATION or new SDK. Bad pop is fatal.
            _objc_fatal
                ("Invalid or prematurely-freed autorelease pool %p.", token);
        }

        // Old SDK. Bad pop is warned once.
        static bool complained = false;
        if (!complained) {
            complained = true;
            _objc_inform_now_and_on_crash
                ("Invalid or prematurely-freed autorelease pool %p. "
                 "Set a breakpoint on objc_autoreleasePoolInvalid to debug. "
                 "Proceeding anyway because the app is old "
                 "(SDK version " SDK_FORMAT "). Memory errors are likely.",
                     token, FORMAT_SDK(sdkVersion()));
        }
        objc_autoreleasePoolInvalid(token);
    }

    template<bool allowDebug>
    static void
    popPage(void *token, AutoreleasePoolPage *page, id *stop)
    {
        if (allowDebug && PrintPoolHiwat) printHiwat();

        page->releaseUntil(stop);

        // memory: delete empty children
        if (allowDebug && DebugPoolAllocation  &&  page->empty()) {
            // special case: delete everything during page-per-pool debugging
            AutoreleasePoolPage *parent = page->parent;
            page->kill();
            setHotPage(parent);
        } else if (allowDebug && DebugMissingPools  &&  page->empty()  &&  !page->parent) {
            // special case: delete everything for pop(top)
            // when debugging missing autorelease pools
            page->kill();
            setHotPage(nil);
        } else if (page->child) {
            // hysteresis: keep one empty child if page is more than half full
            if (page->lessThanHalfFull()) {
                page->child->kill();
            }
            else if (page->child->child) {
                page->child->child->kill();
            }
        }
    }

    __attribute__((noinline, cold))
    static void
    popPageDebug(void *token, AutoreleasePoolPage *page, id *stop)
    {
        popPage<true>(token, page, stop);
    }

    static inline void
    pop(void *token)
    {
        AutoreleasePoolPage *page;
        id *stop;
        if (token == (void*)EMPTY_POOL_PLACEHOLDER) {
            // Popping the top-level placeholder pool.
            page = hotPage();
            if (!page) {
                // Pool was never used. Clear the placeholder.
                return setHotPage(nil);
            }
            // Pool was used. Pop its contents normally.
            // Pool pages remain allocated for re-use as usual.
            page = coldPage();
            token = page->begin();
        } else {
            page = pageForPointer(token);
        }

        stop = (id *)token;
        if (*stop != POOL_BOUNDARY) {
            if (stop == page->begin()  &&  !page->parent) {
                // Start of coldest page may correctly not be POOL_BOUNDARY:
                // 1. top-level pool is popped, leaving the cold page in place
                // 2. an object is autoreleased with no pool
            } else {
                // Error. For bincompat purposes this is not
                // fatal in executables built with old SDKs.
                return badPop(token);
            }
        }

        if (slowpath(PrintPoolHiwat || DebugPoolAllocation || DebugMissingPools)) {
            return popPageDebug(token, page, stop);
        }

        return popPage<false>(token, page, stop);
    }

    static void init()
    {
        int r __unused = pthread_key_init_np(AutoreleasePoolPage::key,
                                             AutoreleasePoolPage::tls_dealloc);
        ASSERT(r == 0);
    }

    __attribute__((noinline, cold))
    void print()
    {
        _objc_inform("[%p]  ................  PAGE %s %s %s", this,
                     full() ? "(full)" : "",
                     this == hotPage() ? "(hot)" : "",
                     this == coldPage() ? "(cold)" : "");
        check(false);
        for (id *p = begin(); p < next; p++) {
            if (*p == POOL_BOUNDARY) {
                _objc_inform("[%p]  ################  POOL %p", p, p);
            } else {
                _objc_inform("[%p]  %#16lx  %s",
                             p, (unsigned long)*p, object_getClassName(*p));
            }
        }
    }

    __attribute__((noinline, cold))
    static void printAll()
    {
        _objc_inform("##############");
        _objc_inform("AUTORELEASE POOLS for thread %p", objc_thread_self());

        AutoreleasePoolPage *page;
        ptrdiff_t objects = 0;
        for (page = coldPage(); page; page = page->child) {
            objects += page->next - page->begin();
        }
        _objc_inform("%llu releases pending.", (unsigned long long)objects);

        if (haveEmptyPoolPlaceholder()) {
            _objc_inform("[%p]  ................  PAGE (placeholder)",
                         EMPTY_POOL_PLACEHOLDER);
            _objc_inform("[%p]  ################  POOL (placeholder)",
                         EMPTY_POOL_PLACEHOLDER);
        }
        else {
            for (page = coldPage(); page; page = page->child) {
                page->print();
            }
        }

        _objc_inform("##############");
    }

    __attribute__((noinline, cold))
    static void printHiwat()
    {
        // Check and propagate high water mark
        // Ignore high water marks under 256 to suppress noise.
        AutoreleasePoolPage *p = hotPage();
        uint32_t mark = p->depth*COUNT + (uint32_t)(p->next - p->begin());
        if (mark > p->hiwat  &&  mark > 256) {
            for( ; p; p = p->parent) {
                p->unprotect();
                p->hiwat = mark;
                p->protect();
            }

            _objc_inform("POOL HIGHWATER: new high water mark of %u "
                         "pending releases for thread %p:",
                         mark, objc_thread_self());

            void *stack[128];
            int count = backtrace(stack, sizeof(stack)/sizeof(stack[0]));
            char **sym = backtrace_symbols(stack, count);
            for (int i = 0; i < count; i++) {
                _objc_inform("POOL HIGHWATER:     %s", sym[i]);
            }
            free(sym);
        }
    }

#undef POOL_BOUNDARY
};


__attribute__((noinline))
void
objc_autoreleasePoolPop(void *ctxt)
{
    AutoreleasePoolPage::pop(ctxt);
}

void *
objc_autoreleasePoolPush(void)
{
    return AutoreleasePoolPage::push();
}

id
objc_autorelease(id obj)
{
    return AutoreleasePoolPage::autorelease(obj);

}
