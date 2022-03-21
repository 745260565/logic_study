//
//  AutoreleasePool.m
//  AutoreleasePool
//
//  Created by ws on 2022/2/15.
//

#import <Foundation/Foundation.h>
#include <pthread.h>
#include <malloc/malloc.h>
#import <objc/runtime.h>

#define POOL_BOUNDARY nil
static pthread_key_t const key = 39;
#define EMPTY_POOL_PLACEHOLDER ((id*)1)
static uint8_t const SCRIBBLE = 0xA3;  // 0xA3A3A3A3 after releasing
static size_t const SIZE = PAGE_MIN_SIZE;

@class AutoreleasePoolPage;
@interface AutoreleasePoolPageData : NSObject {
    @package
    __unsafe_unretained id* _next;
    AutoreleasePoolPage *_parent;
    AutoreleasePoolPage *_child;
}

@end

@implementation AutoreleasePoolPageData



@end

@interface AutoreleasePoolPage : AutoreleasePoolPageData

+ (void *)push;
@end


@implementation AutoreleasePoolPage

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    // AutoreleasePoolPage->起始地址 4k 整数倍 + 4k
    void *as = malloc_zone_memalign(malloc_default_zone(), SIZE, SIZE);
    memset(as, 0, SIZE);
    void *src = [super allocWithZone:zone];
    // block ->
    memmove(as, src, sizeof(src));
    [(id)src release];
    return as;
}
- (instancetype)initWithPage:(AutoreleasePoolPage *)page
{
    self = [super init];
    if (self) {
        _next = [self begin];
        _parent = page;
        if (_parent) {
            _parent->_child = self;
        }
    }
    return self;
}
+ (void *)push {
    id *dest = [self autoreleaseFast:POOL_BOUNDARY];
    assert(dest == EMPTY_POOL_PLACEHOLDER || *dest == POOL_BOUNDARY);
    return dest;
}

+ (id)autorelease:(id)obj {
    assert(obj);
    id *dest __unused = [self autoreleaseFast:obj];
    assert(!dest  ||  dest == EMPTY_POOL_PLACEHOLDER  ||  *dest == obj);
    return obj;
}

+ (void)pop:(void *)token {
    AutoreleasePoolPage *page;
    id *stop;
    if (token == (void*)EMPTY_POOL_PLACEHOLDER) {
        // Popping the top-level placeholder pool.
        page = self.hotPage;
        if (!page) {
            // Pool was never used. Clear the placeholder.
            return [self setHotPage:nil];
        }
        // Pool was used. Pop its contents normally.
        // Pool pages remain allocated for re-use as usual.
        page = self.coldPage;
        token = page.begin;
    } else {
        page = [self pageForPointer:(uintptr_t)token];
    }
    stop = (id *)token;
    return [self popPage:token page:page stop:stop];
}
+ (void)popPage:(void *)token page:(AutoreleasePoolPage *)page stop:(id *)stop {

    [page releaseUntil:stop];

    if (page->_child) {
        // hysteresis: keep one empty child if page is more than half full
        if (page.lessThanHalfFull) {
            [page->_child kill];
        }
        else if (page->_child->_child) {
            [page->_child->_child kill];
        }
    }
}

+ (AutoreleasePoolPage *)pageForPointer:(uintptr_t)p {
    AutoreleasePoolPage *result;
    // p SIZE
    uintptr_t offset = p % SIZE;

    assert(offset >= sizeof([AutoreleasePoolPage class]));
   // p ->page
    result = (AutoreleasePoolPage *)(p - offset);

    return result;
}

+ (BOOL)haveEmptyPoolPlaceholder {
    id *tls = (id *)pthread_getspecific(key);
    return (tls == EMPTY_POOL_PLACEHOLDER);
}
+ (id*)setEmptyPoolPlaceholder {
    assert(pthread_getspecific(key) == nil);
    pthread_setspecific(key, (void *)EMPTY_POOL_PLACEHOLDER);
    return EMPTY_POOL_PLACEHOLDER;
}

+ (AutoreleasePoolPage *)coldPage {
    AutoreleasePoolPage *result = self.hotPage;
    if (result) {
        while (result->_parent) {
            result = result->_parent;
        }
    }
    return result;
}

+ (AutoreleasePoolPage *)hotPage {
    AutoreleasePoolPage *result = (AutoreleasePoolPage *)pthread_getspecific(key);
    if ((id *)result == EMPTY_POOL_PLACEHOLDER) return nil;
    return result;
}
+ (void)setHotPage:(AutoreleasePoolPage *)page {
    pthread_setspecific(key, page);
}
+ (id *)autoreleaseNoPage:(id)obj {
    assert(!self.hotPage);
    BOOL pushExtraBoundary = false;
    if (self.haveEmptyPoolPlaceholder) {
        // We are pushing a second pool over the empty placeholder pool
        // or pushing the first object into the empty placeholder pool.
        // Before doing that, push a pool boundary on behalf of the pool
        // that is currently represented by the empty placeholder.
        pushExtraBoundary = YES;
    } else if (obj == POOL_BOUNDARY) {
        // We are pushing a pool with no pool in place,
        // and alloc-per-pool debugging was not requested.
        // Install and return the empty pool placeholder.
        return [self setEmptyPoolPlaceholder];
    }
    AutoreleasePoolPage *page = [[AutoreleasePoolPage alloc] initWithPage:nil];
    [self setHotPage:page];
    if (pushExtraBoundary) {
        [page add:POOL_BOUNDARY];
    }
    // Push the requested object or pool.
    return [page add:obj];
}


+ (id *)autoreleaseFullPage:(id)obj page:(AutoreleasePoolPage *)page {
    // The hot page is full.
    // Step to the next non-full page, adding a new page if necessary.
    // Then add the object to that page.
    assert(page == self.hotPage);
    assert([page full]);

    do {
        if (page->_child) page = page->_child;
        else page = [[self alloc] initWithPage:page];
    } while ([page full]);

    [self setHotPage:page];
    return [page add:obj];
}
// autorelease-》
+ (id *)autoreleaseFast:(id)obj {
    AutoreleasePoolPage *page = [self hotPage];
    if (page && ![page full]) {
        return [page add:obj];
    } else if (page) {
        return [self autoreleaseFullPage:obj page:page];
    } else {
        return [self autoreleaseNoPage:obj];
    }
}

- (BOOL)lessThanHalfFull {
    return (_next - self.begin < (self.end - self.begin) / 2);
}


- (void)releaseUntil:(id *)stop {
    // Not recursive: we don't want to blow out the stack
    // if a thread accumulates a stupendous amount of garbage
    
    while (self->_next != stop) {
        // Restart from hotPage() every time, in case -release
        // autoreleased more objects
        AutoreleasePoolPage *page = self.class.hotPage;

        // fixme I think this `while` can be `if`, but I can't prove it
        while (page.empty) {
            page = page->_parent;
            [self.class setHotPage:page];
        }

        id obj = *--page->_next;
        memset((void*)page->_next, SCRIBBLE, sizeof(*page->_next));

        if (obj != POOL_BOUNDARY) {
            [obj release];
        }
    }
    [self.class setHotPage:self];
}

- (void)kill
{
    // Not recursive: we don't want to blow out the stack
    // if a thread accumulates a stupendous amount of garbage
    AutoreleasePoolPage *page = self;
    while (page->_child) page = page->_child;

    AutoreleasePoolPage *deathptr;
    do {
        deathptr = page;
        page = page->_parent;
        if (page) {
            page->_child = nil;
        }
        [deathptr release];
    } while (deathptr != self);
}
- (id *)add:(id)obj {
    assert(!self.full);
    id *ret = _next;
    *_next++ = obj;
    return ret;
}
- (id *)begin {
    return (id *)((uint8_t *)self + class_getInstanceSize(self.class));
}

- (id *)end {
    return (id *) ((uint8_t *)self + SIZE);
}

- (BOOL)full {
    return _next == [self end];
}

- (BOOL)empty {
    return _next == [self end];
}

@end


void * objc_autoreleasePoolPush(void)
{
    return [AutoreleasePoolPage push];
}

id objc_autorelease(id obj)
{
    return [AutoreleasePoolPage autorelease:obj];
}

void objc_autoreleasePoolPop(void * _Nonnull context) {
    return [AutoreleasePoolPage pop:context];
}

