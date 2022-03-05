### 一、指针类型

Swift中指针分两类：

**typed pointer**:指定数据类型指针，即**UnsafePointer<T>**,其中T表示**泛型**

**raw pointer**:未指定数据类型的指针（原生指针），即**UnsafeRawPointer**

| Swift                   | Object-C     | 说明                           |
| ----------------------- | ------------ | ------------------------------ |
| unsafePointer<T>        | const T *    | 指针及所指向的内容都**不可变** |
| unsafeMutablePointer<T> | T *          | 指针及所指向的内容都**可变**   |
| unsafeRawPointer        | const void * | 指针指向的内存区域未定         |
| unsafeMutableRawPointer | void *       | 同上                           |



### 二、为什么说批针不安全

- 比如我们在创建一个对象的时候，是需要在堆分配内存空间的。但是这个内存空间的声明周期是有限的，也就意味这如果我们使用指针指向这块内存空间，如果当前内存空间的生命周期到了（引用计数为0），那么我们当前的指针就变成未定义的行为了。
- 我们创建的内存空间是有边界的，比如我们创建一个大小为10的数组，这个时候我们通过指针访问到了index = 11的位置，这个时候就越界了，访问了一个未知的空间。
- 指针类型与内存的值类型不一致，也是不安全的。

### 三、原始指针的使用

```swift
//创建一个内存空间 4个8字节，步长8
//byteCount：当前总的字节大小 alignment：对齐的大小
let p = UnsafeMutableRawPointer.allocate(byteCount: 32, alignment: 8)
for i in 0..<4 {
  //调用store方法存储当前的整型值
  p.storeBytes(of: i, as: Int.self)
}
for i in 0..<4{
  //调用load方法加载当前内存，fromByteOffset就是距离首地址的大小，每次移动i*8的字节
  let value = p.load(fromByteOffset: i*8, as: Int.self)
  print("index:\(i),value:\(value)")
}
/* 
print结果：
index:0,value:3
index:1,value:6917529027915613664
index:2,value:-2305843009213693950
index:3,value:562950227967559
*/
```

这⾥很显然是我们对当前数据的存储⽅式不对，按道理来说我们是 8 个字节， 8个字节的排列开来，⽽在这个过程中存储的好像不知道每个数据与数据之间的间距，所以这⾥我们需要指定⼀个东⻄，那就是每个数据之间在内存中的间距

```swift
for i in 0..<4 {
  //调用store方法存储当前的整型值
  p.advanced(by: i * MemoryLayout<Int>.stride).storeBytes(of: i, as: Int.self)
}
/*
print结果：
index:0,value:0
index:1,value:1
index:2,value:2
index:3,value:3
*/
```

指针每次存储后移动Int长度，结果符合

###### MemoryLayout<T>用法

```swift
//size 指当前类型的实际大小
MemoryLayout<PointClass>.size
//stride 翻译过来是步幅，这里可以认为是内存对齐之后的大小
MemoryLayout<PointClass>.stride
//alignment 指的是内存对齐的方式，是1字节对齐，还是4字节对齐
MemoryLayout<PointClass>.alignment
```

示例：

```swift
struct PointClass {
    var name: String = "abc"
    var age: Int = 18
    var sex: Bool = true
}

print(MemoryLayout<PointClass>.size)
print(MemoryLayout<PointClass>.stride)
print(MemoryLayout<PointClass>.alignment)

打印结果：
25（2*8+8+1）
32（8位对齐）
8
```



### 四、泛型指针的使用

泛型指针相⽐较原⽣指针来说，其实就是指定当前指针已经绑定到了具体的类型

###### 4.1、得到变量内存指针

我们还是通过示例来介绍`type pointer`，我们获取`基本数据类型`的`地址`可以通过`withUnsafePointer(to:)`方法：

```swift
//得到变量内存指针
var age = 18
withUnsafePointer(to: &age) { ptr in
	print(ptr)
}
打印结果：
0x000000016f37b410
```

###### 4.2、访问指针指向的值

```swift
var age = 18
let p = withUnsafePointer(to: &age){$0}

print(p.pointee)

打印结果：18
```

###### 4.3、修改指针指向的值

1、间接修改

```swift
var age = 18
age = withUnsafePointer(to: &age) { ptr in
    return ptr.pointee + 12
}
print(age)

打印结果：30
```

2、通过`withUnsafeMutablePointer`

```swift
var age = 18
withUnsafeMutablePointer(to: &age) { ptr in
    ptr.pointee += 12
}
print(age)

打印结果：30
```

3、通过`allocate`创建`UnsafeMutablePointer`

```swift
var age = 18
//分配容量大小，为8字节
let ptr = UnsafeMutablePointer<Int>.allocate(capacity: 1)
//初始化
ptr.initialize(to: age)
ptr.deinitialize(count: 1)

ptr.pointee += 12
print(ptr.pointee)

//释放
ptr.deallocate()

打印结果：30
```

通过`allocate`创建`UnsafeMutablePointer`，需要注意以下几点

- `initialize` 与 `deinitialize`需成对使用
- `deinitialize`中的`count`与申请时的`capacity`需要`一致`
- 使用完后必须`deallocate`

###### 4.4、通过指针访问结构体对象

定义结构体

```swift
struct PointClass {
    var name: String = "abc"
    var age: Int = 18
    var sex: Bool = true
}
```

然后使用`UnsafeMutablePointer`创建指针，并通过 3 种方式访问结构体对象 t：



### 五、内存指针的使用

### 六、内存绑定

### 七、内存管理

### 八、弱引用

### 九、Unowned/Weak

### 十、闭包循环引用