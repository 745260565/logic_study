### 一、影响对象内存的因素

在这里我们创建一个类，并实例化一个对象来分析：

```swift
@interface FMUserInfo : NSObject
//isa  8
@property (nonatomic ,copy) NSString *name;  //8
@property (nonatomic ,copy) NSString *address;  //8
@property (nonatomic ,assign) int age;   //4
@property (nonatomic ,assign) double hight;  //8
@property (nonatomic ,assign) short number;  //2
-(void)getUserCurrentInfo;
-(void)getUserCurrentLocation;
@end
```

实例化该对象

```swift
#import <Foundation/Foundation.h>
#import "FMUserInfo.h"
#import <malloc/malloc.h>
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        FMUserInfo *user1 = [[FMUserInfo alloc]init];
        NSLog(@"user1 实际运行内存分配大小为：%lu",malloc_size((__bridge const void *)(user1)));
        FMUserInfo *user2 = [[FMUserInfo alloc]init];
        user2.name = @"zhangsan";
        user2.address = @"SD";
        user2.age = 18;
        user2.hight = 180.0;
        user2.number = 120;
        NSLog(@"user2 实际运行内存分配大小为：%lu",malloc_size((__bridge const void *)(user2)));
        NSLog(@"创建的FMUserInfo类型对象所有实例变量实际占用的内存大小：%lu", class_getInstanceSize([FMUserInfo class]));
    }
    return 0;
}
```

运行结果为：

```swift
2022-05-11 16:29:02.181309+0800 alloc_test[80843:3516943] user1 实际运行内存分配大小为：48
2022-05-11 16:29:02.182127+0800 alloc_test[80843:3516943] user2 实际运行内存分配大小为：48
2022-05-11 16:29:02.182234+0800 alloc_test[80843:3516943] 创建的FMUserInfo类型对象所有实例变量实际占用的内存大小：40
Program ended with exit code: 0
```

运行结果说明：

1. 我们创建出一个对象，即便不对对象中的属性进行赋值，对象中的属性仍然占用空间。
2. `FMUserInfo`占用的内存大小为40，为8（isa） + 8 + 8 + 4 + 8 + 2 = 38个字节；但是`class_getInstanceSize`方法底层调用的是`alignedInstanceSize -> word_align(unalignedInstanceSize()) -> return (x + WORD_MASK) & ~WORD_MASK;`且64位的系统中`WORD_MASK`为8字节对齐,故这里`FMUserInfo`实际占用的内存大小为40
3. 对象中的方法并没有占用空间。
4. 实际运行中对象所创建出来的大小为48，因为实际内存分配的时候是以16字节对齐。

如果我们在类中添加一个char类型的属性，并对会有什么变化？

```swift
@interface FMUserInfo : NSObject
//isa  8
@property (nonatomic ,copy) NSString *name;  //8
@property (nonatomic ,copy) NSString *address;  //8
@property (nonatomic ,assign) int age;   //4
@property (nonatomic ,assign) double hight;  //8
@property (nonatomic ,assign) short number;  //2
@property (nonatomic ,assign) char sex;  //1
-(void)getUserCurrentInfo;
-(void)getUserCurrentLocation;
@end
```

```swift
FMUserInfo *user1 = [[FMUserInfo alloc]init];
NSLog(@"user1 实际运行内存分配大小为：%lu",malloc_size((__bridge const void *)(user1)));
FMUserInfo *user2 = [[FMUserInfo alloc]init];
user2.name = @"zhangsan";
user2.address = @"SD";
user2.age = 18;
user2.hight = 180.0;
user2.number = 120;
user2.sex = 1;
NSLog(@"user2 实际运行内存分配大小为：%lu",malloc_size((__bridge const void *)(user2)));
NSLog(@"创建的FMUserInfo类型对象所有实例变量实际占用的内存大小：%lu", class_getInstanceSize([FMUserInfo class]));
```

运行结果为：

```swift
2022-05-11 16:39:21.371071+0800 alloc_test[80977:3527684] user1 实际运行内存分配大小为：48
2022-05-11 16:39:21.371606+0800 alloc_test[80977:3527684] user2 实际运行内存分配大小为：48
2022-05-11 16:39:21.371680+0800 alloc_test[80977:3527684] 创建的FMUserInfo类型对象所有实例变量实际占用的内存大小：40
Program ended with exit code: 0
```

可以看到内存并没有变化，我们可以通过打印内存中的值来具体查看其内存分布

<img src="/Users/chenghao/Desktop/1652261055892.jpg" alt="1652261055892" style="zoom:70%;" />

<img src="/Users/chenghao/Desktop/1652261337524.jpg" alt="1652261337524" style="zoom:70%;" />

上边两张图中，第一张图为不加char类型属性`sex`的内存分布，第二张图为加了char类型属性`sex`的内存分布，我们可以看到**系统会对我们创建的对象属性进行自动重排顺序，已达到优化内存的目的**。

### 二、继承对内存的影响

子类是否会参与父类的属性重排。由前文可得知，由于苹果系统会对我们的类对象进行属性重排，所以类中属性的顺序并不会影响实际开辟出来的内存大小，那么在父子类的继承关系中，如果子类参与了父类的属性重排，那么父类中属性的顺序变化不会影响子类在实例化对象的时候，开辟出来的内存大小。反之，如果没有参与，则父类的属性顺序就会影响子类开辟的内存大小。我们从实际出发，先准备两个类。

```swift
@interface FMTestObject : NSObject
{
    @public
    int count;
    NSObject *objc1;
    NSObject *objc2;
}
@end

@interface FMTestObject1 : FMTestObject
{
    @public
    short _count2;
}
@end
```

```swift
FMTestObject1 *objc1 = [[FMTestObject1 alloc] init];
NSLog(@"objc1实际占用的内存空间为%zd",class_getInstanceSize([FMTestObject1 class]));
NSLog(@"系统为objc1开辟的内存空间为%zd",malloc_size((__bridge const void *)objc1));
```

分别放开父类count和注释count调试结果为：

```swift
2022-05-11 17:47:07.461072+0800 alloc_test[82422:3595853] objc1实际占用的内存空间为40
2022-05-11 17:47:07.461658+0800 alloc_test[82422:3595853] 系统为objc1开辟的内存空间为48
Program ended with exit code: 0
```

```swift
2022-05-11 17:49:07.483390+0800 alloc_test[82464:3597987] objc1实际占用的内存空间为32
2022-05-11 17:49:07.484043+0800 alloc_test[82464:3597987] 系统为objc1开辟的内存空间为32
Program ended with exit code: 0
```

其中上图为count属性在第一行时的由子类实例化出的对象内存空间分配情况，下图为count属性在最后一行时的由子类实例化出的对象内存空间分配情况。显而易见，子类并没有参与父类的属性重排。究其原因，**当我们的子类在继承父类的数据结构的时候，父类是一块连续的内存空间，子类是没办法修改父类的数据结构的，苹果在进行属性重排的时候，只是基于某个类，并不会把子类的成员变量与父类的成员变量重排在一起。**

**总结** 对象里面存储了`一个isa指针 + 成员变量的值`，`isa指针`是固定的，占8个字节，所以影响对象内存的只有成员变量(属性会自动生成带下划线的成员变量).

### 三、联合体和位域

#### 联合体

###### 定义

联合体也叫共用体，是一种构造类型的数据结构。在一个联合体内能够定义多种不同的数据类型。一个被说明为该联合体类型的变量中。同意装入该联合体所定义的不论什么一种数据。这些数据共享同一段内存，以达到节省空间的目的。 联合体有两个特性：

1. 在union中，分配内存空间的大小，等于占内存最大的数据类型字节大小。
2. 共享同一段内存

以最简单的一个联合体为例：

```swift
union Un//联合类型的声明,union是联合体关键字
{
    char c;//1字节
    int i;//4字节
}un1;

NSLog(@"%lu",sizeof(un1));
NSLog(@"%p %p %p",&un1,&un1.c,&un1.i);

//输出结果：
2022-05-12 10:24:45.054895+0800 alloc_test[90122:4048245] 4
2022-05-12 10:24:45.055599+0800 alloc_test[90122:4048245] 0x7ff7bfeff2f0 0x7ff7bfeff2f0 0x7ff7bfeff2f0
```

我们通过打印知道这个联合体总计占4个字节，而联合体成员i是int类型的，它占了4个字节，另外一个c是char类型占了1个字节，两个一起占了4个字节。说明c和i必然有一处是共用一块空间的，再者有`un1`本身和它的两个成员是一个地址如上图`0x7ff7bfeff2f0`，说明首地址是重合的.

由于联合体这种特点就导致了，你改变c，i也会随之改变。这里和结构体是完全不一样的，结构体成员相互独立，但联合体不一样，改一个，其他的也会改变。所以这里，在同一时间，你只能使用一个联合体成员，你使用c就不要用i，因为你c改变的时候，一定会影响到你i的使用，程序非常容易出问题。

###### 内存分析

在计算联合体大小之前我们必须知道两个知识点：

1. 联合体必须能够容纳最大的成员变量（联合体的大小至少是最大成员的大小）
2. 通过1计算出的联合体⼤⼩必须是联合体中占内存⼤⼩最⼤的基本数据类型⼤⼩的整数倍

```swift
union Un1
{
char c[5];//1个char类型占1字节，5个占5字节
int i;//4字节
} un1;
union Un2
{
short c[7];//1个short类型占2字节，7个占14字节
int i;//4字节
}un2;


NSLog(@"%lu",sizeof(un1));
NSLog(@"%lu",sizeof(un2));

//打印结果：
2022-05-12 10:30:01.508085+0800 alloc_test[90179:4054033] 8
2022-05-12 10:30:01.508874+0800 alloc_test[90179:4054033] 16
```

`Un1`: char创建一个大小为5的数组和放5个char类型的是一样道理，其基本数据类型为char，为1字节。int类型的i自身大小4字节，根据上述的联合体内存规则，最大成员大小为5，但是5不是最大基本数据类型的整数倍，所以我们需要对齐到最大基本数据类型的整数倍为8字节。

`Un2`： short创建的c数组，我们同上可知其c基本数据类型char是2字节，i的基本数据类型int是4字节，最大成员大小也就是c数组大小为14字节,14并不是最大基本数据类型4的整数倍，14往上对齐到16,16是4的整数倍。故内存大小为16。

###### 结构体和联合体的区别

结构体(struct)中所有变量是“共存”的，⽽联合体(union)中是各变量是“互斥”的，只能存在⼀个。
struct内存空间的分配是粗放的，不管⽤不⽤，全部分配。
这样带来的⼀个坏处就是对于内存的消耗要⼤⼀些。但是结构体⾥⾯的数据是完整的。
联合体⾥⾯的数据只能存在⼀个，但优点是内存使⽤更为精细灵活，也节省了内存空间。

#### 位域

###### 定义

有些信息在存储时，并不需要占用一个完整的字节，而只需占几个或一个二进制位。例如在存放一个开关量时，只有 0 和 1 两种状态，用一位二进位即可。为了节省存储空间，并使处理简便，Ｃ语言又提供了一种数据结构，称为“`位域`”。所谓“`位域`”是把一个字节中的二进位划分为几个不同的区域，并说明每个区域的位数。每个域有一个域名，允许在程序中按域名进行操作。这样就可以把几个不同的对象用一个字节的二进制位域来表示。

```c++
//定义：
struct 位域结构名 {
    位域列表
};
//示例：
struct FMStruct {
    // a: 位域名  7:位域长度
    char a : 7;
    char b : 2;
    char c : 7;
    char d : 2;
};
```

###### 内存分析：

- 一个位域必须存储在同一个字节中，不能跨两个字节。如一个字节所剩空间不够存放另一位域时，应从下一单元起存放该位域。
- 位域的长度不能超过数据类型的最大长度。 例如：char类型成员变量最大只占`8位`，那么位域长度最大不能超过`8`，又如`int`类型为4字节32位，那么位域长度最大不能超过`32`

```c++
struct Struct2 {
    // a: 位域名  32:位域长度             所占内存
    int  m : 32; // m 直接占用32位               ---4
    char a : 7;  // a 占用 7位                  ---1
    char b : 2;  // b 由于上一字节所剩空间为1，位域不能跨两个字节，所以b从新字节开始放。 ---1
    char c : 7;  // c 由于上一字节所剩空间为6，位域不能跨两个字节，所以c从新字节开始放  ---1
    char d : 2;  // d 由于上一字节所剩空间为1，位域不能跨两个字节，所以d从新字节开始放  ---1
    char e : 6;  // e 由于上一字节所剩空间为6，可以存放e
    char f : 2;  // e 由于上一字节所剩空间为0，所以f从新字节开始放    --- 1
}struct2;
```

`struct2`结构体共占用9字节，但是由于结构体的内存对齐，需要是其最大成员的整数倍，故为12字节。

### 四、nonpointerIsa

前面知道了`_class_createInstanceFromZone`方法用于创建对象，开辟内存空间、并把对象isa与类做关联。源码如下：

```c++
static ALWAYS_INLINE id
_class_createInstanceFromZone(Class cls, size_t extraBytes, void *zone,
                              int construct_flags = OBJECT_CONSTRUCT_NONE,
                              bool cxxConstruct = true,
                              size_t *outAllocatedSize = nil)
{
		....
    if (!zone && fast) {
        obj->initInstanceIsa(cls, hasCxxDtor);
    } else {
        // Use raw pointer isa on the assumption that they might be
        // doing something weird with the zone or RR.
        obj->initIsa(cls);
    }
		....
}

inline void 
objc_object::initInstanceIsa(Class cls, bool hasCxxDtor)
{
    ASSERT(!cls->instancesRequireRawIsa());
    ASSERT(hasCxxDtor == cls->hasCxxDtor());

    initIsa(cls, true, hasCxxDtor);
}
```

通过上面源码可以发现，开辟内存空间后，`obj`都会调用`initIsa`方法。查看initIsa源码

```c++
inline void 
objc_object::initIsa(Class cls, bool nonpointer, UNUSED_WITHOUT_INDEXED_ISA_AND_DTOR_BIT bool hasCxxDtor)
{ 
    ASSERT(!isTaggedPointer()); 
    
    isa_t newisa(0);

		....
}
```

```c++
union isa_t {
		....
public:
#if defined(ISA_BITFIELD)
    struct {
        ISA_BITFIELD;  // defined in isa.h
    };
		....
};
```

`initIsa`方法中，最核心的就是对对象的isa指针进行初始化，同时我们发现了`isa_t`的数据类型为`union`联合体类型。 在联合体中，我们可以看到对于`nonpointerIsa`的定义；由于`nonpointerIsa`不同设备定义不同，分成`x86`与`arm64`分别对应如下

```swift
# elif __x86_64__
#   define ISA_MASK        0x00007ffffffffff8ULL
#   define ISA_MAGIC_MASK  0x001f800000000001ULL
#   define ISA_MAGIC_VALUE 0x001d800000000001ULL
#   define ISA_HAS_CXX_DTOR_BIT 1
#   define ISA_BITFIELD                                                        \
      uintptr_t nonpointer        : 1;                                         \
      uintptr_t has_assoc         : 1;                                         \
      uintptr_t has_cxx_dtor      : 1;                                         \
      uintptr_t shiftcls          : 44; /*MACH_VM_MAX_ADDRESS 0x7fffffe00000*/ \
      uintptr_t magic             : 6;                                         \
      uintptr_t weakly_referenced : 1;                                         \
      uintptr_t unused            : 1;                                         \
      uintptr_t has_sidetable_rc  : 1;                                         \
      uintptr_t extra_rc          : 8
#   define RC_ONE   (1ULL<<56)
#   define RC_HALF  (1ULL<<7)
```

```swift
# if __arm64__
// ARM64 simulators have a larger address space, so use the ARM64e
// scheme even when simulators build for ARM64-not-e.
#   if __has_feature(ptrauth_calls) || TARGET_OS_SIMULATOR
#     define ISA_MASK        0x007ffffffffffff8ULL
#     define ISA_MAGIC_MASK  0x0000000000000001ULL
#     define ISA_MAGIC_VALUE 0x0000000000000001ULL
#     define ISA_HAS_CXX_DTOR_BIT 0
#     define ISA_BITFIELD                                                      \
        uintptr_t nonpointer        : 1;                                       \
        uintptr_t has_assoc         : 1;                                       \
        uintptr_t weakly_referenced : 1;                                       \
        uintptr_t shiftcls_and_sig  : 52;                                      \
        uintptr_t has_sidetable_rc  : 1;                                       \
        uintptr_t extra_rc          : 8
#     define RC_ONE   (1ULL<<56)
#     define RC_HALF  (1ULL<<7)
#   else
#     define ISA_MASK        0x0000000ffffffff8ULL
#     define ISA_MAGIC_MASK  0x000003f000000001ULL
#     define ISA_MAGIC_VALUE 0x000001a000000001ULL
#     define ISA_HAS_CXX_DTOR_BIT 1
#     define ISA_BITFIELD                                                      \
        uintptr_t nonpointer        : 1;                                       \
        uintptr_t has_assoc         : 1;                                       \
        uintptr_t has_cxx_dtor      : 1;                                       \
        uintptr_t shiftcls          : 33; /*MACH_VM_MAX_ADDRESS 0x1000000000*/ \
        uintptr_t magic             : 6;                                       \
        uintptr_t weakly_referenced : 1;                                       \
        uintptr_t unused            : 1;                                       \
        uintptr_t has_sidetable_rc  : 1;                                       \
        uintptr_t extra_rc          : 19
#     define RC_ONE   (1ULL<<45)
#     define RC_HALF  (1ULL<<18)
#   endif
```

其每个字段对应含义:

- `nonpointer`：表示是否对isa指针开启指针优化。0：纯isa指针，1：不⽌是类对象地址，isa中包含了类信息、对象的引⽤计数等
- `has_assoc`：关联对象标志位。0：不存在，1：存在
- `has_cxx_dtor`：该对象是否有C++或者Objc的析构器。如果有析构函数，则需要做析构逻辑。如果没有，则可以更快的释放对象
- `shiftcls`：存储类指针的值。开启指针优化的情况下，在arm64架构中，有 33位⽤来存储类指针
- `magic`：⽤于调试器判断当前对象是真的对象还是没有初始化的空间
- `weakly_referenced`：标志对象是否被指向或者曾经指向⼀个ARC的弱变量，没有弱引⽤的对象可以更快释放
- `unused`：标志对象是否正在使用（释放）
- `has_sidetable_rc`：当对象引⽤计数⼤于10时，则需要借⽤该变量存储进位
- `extra_rc`：表示该对象的引⽤计数值，实际上是引⽤计数值减1。例如，如果对象的引⽤计数为10，那么`extra_rc`为9。如果引⽤计数⼤于 10，则需要使⽤到`has_sidetable_rc`

![d5ee7f53983b4b7c9e2faa685a3f129e~tplv-k3u1fbpfcp-zoom-in-crop-mark-1304-0-0-0.image](/Users/chenghao/Desktop/d5ee7f53983b4b7c9e2faa685a3f129e~tplv-k3u1fbpfcp-zoom-in-crop-mark-1304-0-0-0.image.png)

### 五、通过ISA位运算得到类对象

###### 5.1、通过掩码

苹果给了我们可以方便获取类信息的掩码`ISA_MASK`，我们通过`对象的地址`& `ISA_MASK`就能得到类地址

<img src="/Users/chenghao/Desktop/1652325935458.jpg" alt="1652325935458" style="zoom:67%;" />

###### 5.2、通过移位

根据规则，位运算，手动计算。

`shiftcls`存储的是类指针的值，那把isa指针中其他的值都去掉，就能获得类对象的指针。以x86_64架构为例，`ISA_BITFIELD`一共存储了64位的数据，首页我们将这段数据左移3位，再右移3位，那么前面3位`nonpointer`、`has_assoc`、`has_cxx_dtor`的值都变成了0，那么我们接着向右移动17位，同理右边的数据也都变成了0，最后在左移17位回到原位，那么`ISA_BITFIELD`中就只剩下了`shiftcls`的值。这个移动的过程，我们可以优化成先左移3位去除左边3位的数据，右移20位直接去除右边的数据，再左移17位回到原来的位置。

那么我们现在通过控制台打印来验证一下。先通过`x/4gxp`命令获取到对象的isa指针，然后将指针移动完毕后得到的`shiftcls`的值，接着我们查看`LGPerson`类对象的地址，发现二者一致，证明了`shiftcls`就是类对象的地址，并且我们可以通过对象的isa指针获取到对象所属类对象的地址。

![1652337926721](/Users/chenghao/Desktop/1652337926721.jpg)

### 六、总结

###### 6.1、字节对齐

字节是内存的容量单位。但是，CPU在读取内存的时候，却不是以字节为单位来读取的，⽽是以“块”为单位读取的，所以⼤家也经常听到⼀块内存，“块”的⼤⼩也就是内存存取的⼒度。如果不对⻬的话，在我们频繁的存取内存的时候，CPU就需要花费⼤量的精⼒去分辨你要读取多少字节，这就会造成CPU的效率低下，如果想要CPU能够⾼效读取数据，那就需要找⼀个规范，这个规范就是字节对⻬。

###### 6.2、为什么对象内部的成员变量是以8字节对⻬，系统实际分配的内存以16字节对⻬？

以空间换时间。苹果采取16字节对⻬，是因为OC的对象中，第⼀位叫isa指针，它是必然存在的，⽽且它就占了8位字节，就算对象中没有其他的属性了，也⼀定有⼀个isa，那对象就⾄少要占⽤8位字节。如果以8位字节对⻬的话，如果连续的两块内存都是没有属性的对象，那么它们的内存空间就会完全的挨在⼀起，是容易混乱的。以16字节为⼀块，这就保证了CPU在读取的时候，按照块读取就可以，效率更⾼，同时还不容易混乱。

###### 6.3、影响对象内存的因素

对象⾥⾯存储了isa指针 + 成员变量的值，isa指针是固定的，占8个字节，所以影响对象内存的只有成员变量（属性会⾃动⽣成带下划线的成员变量）。

###### 6.4、对象的内存分布

在对象的内部是以8字节进⾏对⻬的。苹果会⾃动重排成员变量的顺序，将占⽤不⾜ 8 字节的成员挨在⼀起，凑满8字节，以达到优化内存的⽬的。

###### 6.5、nonPointerIsa

nonPointerIsa是内存优化的⼀种⼿段。isa是⼀个Class类型的结构体指针，占8个字节，主要是⽤来存内存地址的。但是8个字节意味着它就有8*8=64位。存储地址根本不需要这么多的内存空间。⽽且每个对象都有个isa指针，这样就浪费了内存。所以苹果就把和对象⼀些息息相关的东⻄，存在了这块内存空间⾥⾯。这种isa指针就叫nonPointerIsa。