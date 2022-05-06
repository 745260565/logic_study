### 一、准备工作

###### 1.1、相关资源

- 苹果开源地址：https://opensource.apple.com/releases/
- objc4-838下载链接：https://github.com/apple-oss-distributions/objc4/archive/objc4-838.tar.gz
- libmalloc下载链接：https://github.com/apple-oss-distributions/libmalloc/archive/libmalloc-374.60.3.tar.gz

###### 1.2、三种断点调试思路

- 断点：使用真机下断点，按住control点击step in
- 符号断点：command+8，Xcode左下角点击“+”，选择Symbolic Breakpoint，输入断点关键字，增加断点
- 汇编：断点停住时，在Xcode菜单栏中选择Debug->Debug WorkFlow->Always Show Disassembly，按住control点击step in

### 二、alloc底层探究

###### 2.1、调用流程

在源码中断点alloc并深入，得知alloc调用流程是：

*alloc*->*objc_alloc*->*callAlloc*->*objc_msgSend(alloc)*->*_objc_rootAlloc*->*callAlloc*->*_objc_rootAllocWithZone*->*_class_createInstanceFromZone*

如果用command查看alloc源码，发现是下面这样：

```swift
+ (id)alloc {
    return _objc_rootAlloc(self);
}
```

那为何第一步`alloc`是执行`objc_alloc`呢，原因是llvm对底层方法进行了优化，`alloc`被hook成了`objc_alloc`，这样做的目的就是标记一个`receiver`，在标记完这个类为`receiver`之后都会进入普通的消息发送判断（调用`fixupMessageRef`，然后第二次进入的`alloc`方法），这样做的目的其实就是间接符号的绑定。当然在`fixupMessageRef`中似乎不止`alloc`，还有其他的几个方法，例如`release`，`retain`等。

```swift
/***********************************************************************
* fixupMessageRef
* Repairs an old vtable dispatch call site. 
* vtable dispatch itself is not supported.
**********************************************************************/
static void 
fixupMessageRef(message_ref_t *msg)
{    
    msg->sel = sel_registerName((const char *)msg->sel);

    if (msg->imp == &objc_msgSend_fixup) { 
        if (msg->sel == @selector(alloc)) {
            msg->imp = (IMP)&objc_alloc;
        } else if (msg->sel == @selector(allocWithZone:)) {
            msg->imp = (IMP)&objc_allocWithZone;
        } else if (msg->sel == @selector(retain)) {
            msg->imp = (IMP)&objc_retain;
        } 
    } 
......
}
```

###### 2.2、callAlloc

注意到上面callAlloc执行了两次，分析callAlloc源码

```swift
/**
 注意：
 slowpath和fastpath 这两个都是objc源码中定义的宏，其定义如下:
 //x很可能为真， fastpath 可以简称为 真值判断
 #define fastpath(x) (__builtin_expect(bool(x), 1))
 //x很可能为假，slowpath 可以简称为 假值判断
 #define slowpath(x) (__builtin_expect(bool(x), 0))
 
 其中的__builtin_expect指令是由gcc引入的，
 1、目的：编译器可以对代码进行优化，以减少指令跳转带来的性能下降。即性能优化
 2、作用：允许程序员将最有可能执行的分支告诉编译器。
 3、指令的写法为：__builtin_expect(EXP, N)。表示 EXP==N的概率很大。
 4、fastpath定义中__builtin_expect((x),1)表示x的值为真的可能性更大；即 执行if 里面语句的机会更大
 5、slowpath定义中的__builtin_expect((x),0)表示 x 的值为假的可能性更大。即执行else 里面语句的机会更大
 6、在日常的开发中，也可以通过设置来优化编译器，达到性能优化的目的，设置的路径为：Build Setting --> Optimization Level --> Debug --> 将None 改为 fastest 或者 smallest

 cls->ISA()->hasCustomAWZ()

 其中fastpath中的 cls->ISA()->hasCustomAWZ() 表示判断一个类是否有自定义的 +allocWithZone 实现，这里通过断点调试，是没有自定义的实现，所以会执行到 if 里面的代码，即走到_objc_rootAllocWithZone。
 */
static ALWAYS_INLINE id
callAlloc(Class cls, bool checkNil, bool allocWithZone=false)
{
#if __OBJC2__
    if (slowpath(checkNil && !cls)) return nil;
    if (fastpath(!cls->ISA()->hasCustomAWZ())) {
        return _objc_rootAllocWithZone(cls, nil);
    }
#endif

    // No shortcuts available.
    if (allocWithZone) {
        return ((id(*)(id, SEL, struct _NSZone *))objc_msgSend)(cls, @selector(allocWithZone:), nil);
    }
    return ((id(*)(id, SEL))objc_msgSend)(cls, @selector(alloc));
}
```

###### 2.3、alloc流程图

<img src="/Users/chenghao/Downloads/16504334556659.jpg" alt="16504334556659" style="zoom:50%;" />

### 三、对象的创建流程

可以看到，alloc最后走到的方法是_class_createInstanceFromZone，此方法主要做了下面三件事：

- `cls->instanceSize(extraBytes)` 计算需要开辟的内存空间大小
- `obj = (id)calloc(1, size)` 申请内存，返回地址指针
- `obj->initInstanceIsa(cls, hasCxxDtor)` 将 类 与 isa 关联

```swift
static ALWAYS_INLINE id
_class_createInstanceFromZone(Class cls, size_t extraBytes, void *zone,
                              int construct_flags = OBJECT_CONSTRUCT_NONE,
                              bool cxxConstruct = true,
                              size_t *outAllocatedSize = nil)
{
    ASSERT(cls->isRealized());

    // Read class's info bits all at once for performance
    bool hasCxxCtor = cxxConstruct && cls->hasCxxCtor();
    bool hasCxxDtor = cls->hasCxxDtor();
    bool fast = cls->canAllocNonpointer();
    size_t size;
    //计算当前类需要开辟的内存空间大小
    size = cls->instanceSize(extraBytes);
    if (outAllocatedSize) *outAllocatedSize = size;

    id obj;
    if (zone) {
        obj = (id)malloc_zone_calloc((malloc_zone_t *)zone, 1, size);
    } else {
        //申请内存空间
        obj = (id)calloc(1, size);
    }
    if (slowpath(!obj)) {
        if (construct_flags & OBJECT_CONSTRUCT_CALL_BADALLOC) {
            return _objc_callBadAllocHandler(cls);
        }
        return nil;
    }

    if (!zone && fast) {
        //将类cls和obj指针进行关联
        obj->initInstanceIsa(cls, hasCxxDtor);
    } else {
        // Use raw pointer isa on the assumption that they might be
        // doing something weird with the zone or RR.
        obj->initIsa(cls);
    }

    if (fastpath(!hasCxxCtor)) {
        return obj;
    }

    construct_flags |= OBJECT_CONSTRUCT_FREE_ONFAILURE;
    return object_cxxConstructFromClass(obj, cls, construct_flags);
}
```

###### 3.1、 instanceSize-要开辟的内存空间大小计算

查看 instanceSize源码

```swift
// Class's ivar size rounded up to a pointer-size boundary.
uint32_t alignedInstanceSize() const {
  return word_align(unalignedInstanceSize());
}

inline size_t instanceSize(size_t extraBytes) const {
  if (fastpath(cache.hasFastInstanceSize(extraBytes))) {
    return cache.fastInstanceSize(extraBytes);
  }

  size_t size = alignedInstanceSize() + extraBytes;
  // CF requires all objects be at least 16 bytes.
  if (size < 16) size = 16;
  return size;
}
```

在源码中可以看到 对象的最终内存大小 先调用 `alignedInstanceSize`，这里是通过内存对齐的方式计算一个类的结构所需的大小

```swift
#ifdef __LP64__
#   define WORD_SHIFT 3UL
#   define WORD_MASK 7UL
#   define WORD_BITS 64
#else
#   define WORD_SHIFT 2UL
#   define WORD_MASK 3UL
#   define WORD_BITS 32
#endif
// Class's ivar size rounded up to a pointer-size boundary.
uint32_t alignedInstanceSize() const {
  return word_align(unalignedInstanceSize());
}
static inline uint32_t word_align(uint32_t x) {
    return (x + WORD_MASK) & ~WORD_MASK;
}
```

从源码中可以得出是通过8的倍数内存对齐的，也就是说 `alignedInstanceSize` 计算的大小一定是 8的倍数

```swift
#ifdef __LP64__
#   define WORD_SHIFT 3UL
#   define WORD_MASK 7UL
#   define WORD_BITS 64
#else
#   define WORD_SHIFT 2UL
#   define WORD_MASK 3UL
#   define WORD_BITS 32
#endif
static inline uint32_t word_align(uint32_t x) {
    return (x + WORD_MASK) & ~WORD_MASK;
}
```

那么对于 一个对象实际所需的内存大小是通过，类中的一些信息来直接读取的，由此来作为内存补齐的基数

```swift
// May be unaligned depending on class's ivars.
uint32_t unalignedInstanceSize() const {
  ASSERT(isRealized());
  return data()->ro()->instanceSize;
}
```

到这里还没有对象所需的大小还没计算完成，在源码中可以看到最终会返回至少 16

```swift
// CF requires all objects be at least 16 bytes.
if (size < 16) size = 16;
```

也就是说，一个对象的内存大小 `size >= 16`

###### 3.2、 calloc-申请内存

通过打印了`calloc` 方法可以看到这个方法在 `libsystem_malloc`库里面

<img src="/Users/chenghao/Desktop/截屏2022-04-27 15.00.28.png" alt="截屏2022-04-27 15.00.28" style="zoom:80%;" />

断点调试lib system_malloc源码，最终调用的是_malloc_zone_calloc，这里可以得出，最终获取到返回的指针是通过`zone->calloc(zone, num_items, size);`返回的

```swift
MALLOC_NOINLINE
static void *
_malloc_zone_calloc(malloc_zone_t *zone, size_t num_items, size_t size,
		malloc_zone_options_t mzo)
{
	MALLOC_TRACE(TRACE_calloc | DBG_FUNC_START, (uintptr_t)zone, num_items, size, 0);

	void *ptr;
	if (malloc_check_start) {
		internal_check();
	}
	ptr = zone->calloc(zone, num_items, size);

	if (os_unlikely(malloc_logger)) {
		malloc_logger(MALLOC_LOG_TYPE_ALLOCATE | MALLOC_LOG_TYPE_HAS_ZONE | MALLOC_LOG_TYPE_CLEARED, (uintptr_t)zone,
				(uintptr_t)(num_items * size), 0, (uintptr_t)ptr, 0);
	}

	MALLOC_TRACE(TRACE_calloc | DBG_FUNC_END, (uintptr_t)zone, num_items, size, (uintptr_t)ptr);
	if (os_unlikely(ptr == NULL)) {
		malloc_set_errno_fast(mzo, ENOMEM);
	}
	return ptr;
}
```

此时会发现又无法跟进了，那继续打印 `zone->calloc`，发现这个方法在这个当前库里面

![16504376331962](/Users/chenghao/Downloads/16504376331962.jpg)

搜索 `default_zone_calloc`

```swift
static void *
default_zone_calloc(malloc_zone_t *zone, size_t num_items, size_t size)
{
	zone = runtime_default_zone();
	
	return zone->calloc(zone, num_items, size);
}
```

继续断点调试，找到nano_calloc，这里看到之前返回的指针是通过 `_nano_malloc_check_clear`来获取的，查看源码：

```swift
static void *
nano_calloc(nanozone_t *nanozone, size_t num_items, size_t size)
{
	size_t total_bytes;

	if (calloc_get_size(num_items, size, 0, &total_bytes)) {
		return NULL;
	}

	if (total_bytes <= NANO_MAX_SIZE) {
		void *p = _nano_malloc_check_clear(nanozone, total_bytes, 1);
		if (p) {
			return p;
		} else {
			/* FALLTHROUGH to helper zone */
		}
	}
	malloc_zone_t *zone = (malloc_zone_t *)(nanozone->helper_zone);
	return zone->calloc(zone, 1, total_bytes);
}
```

继续跟进 `_nano_malloc_check_clear`，这里可以得出，`calloc`返回的指针在这里是通过 `segregated_next_block` 函数返回的

```swift
static void *
_nano_malloc_check_clear(nanozone_t *nanozone, size_t size, boolean_t cleared_requested)
{
	MALLOC_TRACE(TRACE_nano_malloc, (uintptr_t)nanozone, size, cleared_requested, 0);

	void *ptr;
	size_t slot_key;
	size_t slot_bytes = segregated_size_to_fit(nanozone, size, &slot_key); // Note slot_key is set here
	mag_index_t mag_index = nano_mag_index(nanozone);

	nano_meta_admin_t pMeta = &(nanozone->meta_data[mag_index][slot_key]);

	ptr = OSAtomicDequeue(&(pMeta->slot_LIFO), offsetof(struct chained_block_s, next));
	if (ptr) {
		unsigned debug_flags = nanozone->debug_flags;
#if NANO_FREE_DEQUEUE_DILIGENCE
		size_t gotSize;
		nano_blk_addr_t p; // the compiler holds this in a register

		p.addr = (uint64_t)ptr; // Begin the dissection of ptr
		if (NANOZONE_SIGNATURE != p.fields.nano_signature) {
			malloc_zone_error(debug_flags, true,
					"Invalid signature for pointer %p dequeued from free list\n",
					ptr);
		}

		if (mag_index != p.fields.nano_mag_index) {
			malloc_zone_error(debug_flags, true,
					"Mismatched magazine for pointer %p dequeued from free list\n",
					ptr);
		}

		gotSize = _nano_vet_and_size_of_free(nanozone, ptr);
		if (0 == gotSize) {
			malloc_zone_error(debug_flags, true,
					"Invalid pointer %p dequeued from free list\n", ptr);
		}
		if (gotSize != slot_bytes) {
			malloc_zone_error(debug_flags, true,
					"Mismatched size for pointer %p dequeued from free list\n",
					ptr);
		}

		if (!_nano_block_has_canary_value(nanozone, ptr)) {
			malloc_zone_error(debug_flags, true,
					"Heap corruption detected, free list canary is damaged for %p\n"
					"*** Incorrect guard value: %lu\n", ptr,
					((chained_block_t)ptr)->double_free_guard);
		}

#if defined(DEBUG)
		void *next = (void *)(((chained_block_t)ptr)->next);
		if (next) {
			p.addr = (uint64_t)next; // Begin the dissection of next
			if (NANOZONE_SIGNATURE != p.fields.nano_signature) {
				malloc_zone_error(debug_flags, true,
						"Invalid next signature for pointer %p dequeued from free "
						"list, next = %p\n", ptr, "next");
			}

			if (mag_index != p.fields.nano_mag_index) {
				malloc_zone_error(debug_flags, true,
						"Mismatched next magazine for pointer %p dequeued from "
						"free list, next = %p\n", ptr, next);
			}

			gotSize = _nano_vet_and_size_of_free(nanozone, next);
			if (0 == gotSize) {
				malloc_zone_error(debug_flags, true,
						"Invalid next for pointer %p dequeued from free list, "
						"next = %p\n", ptr, next);
			}
			if (gotSize != slot_bytes) {
				malloc_zone_error(debug_flags, true,
						"Mismatched next size for pointer %p dequeued from free "
						"list, next = %p\n", ptr, next);
			}
		}
#endif /* DEBUG */
#endif /* NANO_FREE_DEQUEUE_DILIGENCE */

		((chained_block_t)ptr)->double_free_guard = 0;
		((chained_block_t)ptr)->next = NULL; // clear out next pointer to protect free list
	} else {
		ptr = segregated_next_block(nanozone, pMeta, slot_bytes, mag_index);
	}

	if (cleared_requested && ptr) {
		memset(ptr, 0, slot_bytes); // TODO: Needs a memory barrier after memset to ensure zeroes land first?
	}
	return ptr;
}
```

并且在这里对指针的大小又通过 `segregated_size_to_fit`函数做了一个内存对齐，通过源码中的定义可以的看出，对象的内存又做了16字节的内存对齐

```swift
static MALLOC_INLINE size_t
segregated_size_to_fit(nanozone_t *nanozone, size_t size, size_t *pKey)
{
	size_t k, slot_bytes;

	if (0 == size) {
		size = NANO_REGIME_QUANTA_SIZE; // Historical behavior
	}
	k = (size + NANO_REGIME_QUANTA_SIZE - 1) >> SHIFT_NANO_QUANTUM; // round up and shift for number of quanta
	slot_bytes = k << SHIFT_NANO_QUANTUM;							// multiply by power of two quanta size
	*pKey = k - 1;													// Zero-based!

	return slot_bytes;
}
```

对象创建的第一步就是通过`instanceSize`计算内存大小，并且是通过 8字节对齐，那么为什么在 这里又进行16字节对齐呢？

以空间换时间。苹果采取16字节对⻬，是因为OC的对象中，第一位叫isa指针，它是必然存在的， 而且它就占了8位字节，就算对象中没有其他的属性了，也一定有一个isa，那对象就至少要占用8 位字节。如果以8位字节对⻬的话，如果连续的两块内存都是没有属性的对象，那么它们的内存空 间就会完全的挨在一起，是容易混乱的。以16字节为一块，这就保证了CPU在读取的时候，按照块 读取就可以，效率更高，同时还不容易混乱。

###### 3.3、initInstanceIsa-将类和isa关联

```swift
inline void 
objc_object::initIsa(Class cls)
{
    initIsa(cls, false, false);
}
```

```swift
inline void 
objc_object::initIsa(Class cls, bool nonpointer, UNUSED_WITHOUT_INDEXED_ISA_AND_DTOR_BIT bool hasCxxDtor)
{ 
    ASSERT(!isTaggedPointer()); 
    
    isa_t newisa(0);

    if (!nonpointer) {
        newisa.setClass(cls, this);
    } else {
        ASSERT(!DisableNonpointerIsa);
        ASSERT(!cls->instancesRequireRawIsa());


#if SUPPORT_INDEXED_ISA
        ASSERT(cls->classArrayIndex() > 0);
        newisa.bits = ISA_INDEX_MAGIC_VALUE;
        // isa.magic is part of ISA_MAGIC_VALUE
        // isa.nonpointer is part of ISA_MAGIC_VALUE
        newisa.has_cxx_dtor = hasCxxDtor;
        newisa.indexcls = (uintptr_t)cls->classArrayIndex();
#else
        newisa.bits = ISA_MAGIC_VALUE;
        // isa.magic is part of ISA_MAGIC_VALUE
        // isa.nonpointer is part of ISA_MAGIC_VALUE
#   if ISA_HAS_CXX_DTOR_BIT
        newisa.has_cxx_dtor = hasCxxDtor;
#   endif
        newisa.setClass(cls, this);
#endif
        newisa.extra_rc = 1;
    }

    // This write must be performed in a single store in some cases
    // (for example when realizing a class because other threads
    // may simultaneously try to use the class).
    // fixme use atomics here to guarantee single-store and to
    // guarantee memory order w.r.t. the class index table
    // ...but not too atomic because we don't want to hurt instantiation
    isa = newisa;
}
```

这里就是初始化isa指针

### 四、init和new

###### 4.1、init

alloc流程已经清楚，再来查看init方法

```swift
- (id)init {
    return _objc_rootInit(self);
}
```

```swift
id
_objc_rootInit(id obj)
{
    // In practice, it will be hard to rely on this function.
    // Many classes do not properly chain -init calls.
    return obj;
}
```

可以`init`实际什么也没做，返回了它的`self`，所以，`init`方法只是返回了`alloc`之后就返回了对象本身，没有做其他操作，是方便开发者重写自己的逻辑的一种工厂模式

###### 4.2、new

```swift
+ (id)new {
    return [callAlloc(self, false/*checkNil*/) init];
}
```

从源码来看，`new`就是把` alloc + init` 没有什么特别的操作

### 五、总结

到此整个 `alloc`的流程就结束了，在创建对象的时候，` callAlloc` 中会调用两次，因为在类没有初始化的时候需要通过 发送一个`alloc`消息给类，让其调用 `initialize`方法，初始化类

- 这一点可以通过重写`initialize`方法来验证，当第一次进入` callAlloc`时类没有初始化，发送了 `alloc`消息后会调用`initialize`方法

当初始化结束后，在此进入会根据 是否有自定义的 `allocWithZone`的方法判断是通过 `_objc_rootAllocWithZone` 还是自定义的 `allocWithZone` 方法来创建一个对象

- 这一点可以通过自定义`allocWithZone`方法来验证

但是最终都会调用一个 `_class_createInstanceFromZone` ,因为 自定义`allocWithZone` 方法返回的对象也需要走这个流程， 在`_class_createInstanceFromZone` 中会去计算对象的大小，先通过8字节对齐，算出需要的大小，再通过 `calloc`分配内存空间返回一个指针，并且iOS系统会让对象做16字节的对齐，最后在初始化对象的isa 完成对象的创建

对于`init`方法只是一个工厂方法，提供了自定义对象的接口