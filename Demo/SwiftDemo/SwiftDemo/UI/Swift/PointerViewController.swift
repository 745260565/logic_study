//
//  PointerViewController.swift
//  SwiftDemo
//
//  Created by ChengHao on 2022/1/6.
//

import UIKit
import MachO

//第四节课-指针

class PointerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(MemoryLayout<PointClass>.size)
//        print(MemoryLayout<PointClass>.stride)//步长是16，内存对齐
//        print(MemoryLayout<PointClass>.alignment)
        
//        //创建一个内存空间 4个8字节，步长8
//        let p = UnsafeMutableRawPointer.allocate(byteCount: 32, alignment: 8)
//        for i in 0..<4 {
//            p.advanced(by: i * MemoryLayout<Int>.stride).storeBytes(of: i, as: Int.self)
////            p.storeBytes(of: i, as: Int.self)
//        }
//        for i in 0..<4{
//            let value = p.load(fromByteOffset: i*8, as: Int.self)
//            print("index:\(i),value:\(value)")
//        }
        
        //得到变量内存指针
//        var age = 18
//        withUnsafePointer(to: &age) { ptr in
//            print(ptr)
//        }
////
//        age = withUnsafePointer(to: &age) { ptr in
//            return ptr.pointee + 21
//        }
//        print(age)
        
        testStructPoint()
        
        
//        var tPtr = UnsafeMutablePointer<PointStruct>.allocate(capacity: 5)
//        tPtr[0] = PointStruct(age: 19, height: 28)
//
//        //成对出现，回收这一片内存空间
//        tPtr.deinitialize(count: 5)
//        tPtr.deallocate()
//
//        tPtr.advanced(by: 0).initialize(to: <#T##PointStruct#>)
        
//        machoTest()
        
        let tuple = (10,20)
//        withUnsafePointer(to: tuple) { (tupleTpr: UnsafePointer<(Int, Int)>) in
//            testPoint(UnsafeRawPointer(tupleTpr).bindMemory(to: Int.self, capacity: 1))
//        }
        
//        let Uint8Ptr = UnsafePointer<UInt8>.init(bitPattern: 10)
//        Uint8Ptr?.withMemoryRebound(to: Int8.self, capacity: 1){ (int8Ptr: UnsafePointer<Int8>) in
//            testPoint(int8Ptr)
//        }
        var t = PointTeacher()
        //固定用法，打印t这个实例的内存指针
        print(Unmanaged.passUnretained(t as AnyObject).toOpaque())
//        var t1 = t
//        print(Unmanaged.passUnretained(t as AnyObject).toOpaque())
//        var t2 = t
//        print(Unmanaged.passUnretained(t as AnyObject).toOpaque())
//        weak var t1 = t
//        print("end")
        
//        var age = 0
//        var height = 0.0
//        //捕获列表参数都是let ,所以age值在闭包内部不能改变，值类型调用闭包时再捕获
//        let closure = { [age] in
//            print(age)
//            print(height)
//        }
//        age = 10
//        height = 1.87
//        closure()
        
    }
    
    func machoTest(){
        //指针读取Macho中的属性名称
        var size: UInt = 0
        var ptr = getsectdata("__TEXT","__swift5_types", &size)
        //获取当前程序运行的地址
        //得到Macho header的基地址
        var mhHeaderPtr = _dyld_get_image_header(0)
        //获取
        var setCommon64Ptr = getsegbyname("__LINKEDIT")
        //计算当前链接的基地址
        var linkBaseAddress: UInt64 = 0
        if let vmaddr = setCommon64Ptr?.pointee.vmaddr, let fileOff = setCommon64Ptr?.pointee.fileoff{
            linkBaseAddress = vmaddr - fileOff
        }
        
        //内存地址转换成UInt64位置
        var offset: UInt64 = 0
        if let unwrappedPtr = ptr{
            let intRepresentation = UInt64(bitPattern: Int64(Int(bitPattern: unwrappedPtr)))
            offset = intRepresentation - linkBaseAddress
            print(offset)
        }
        
        //DataLo的内存地址
        //将当前程序运行的首地址转成UInt64，便于后续计算
        let mhHeaderPtr_IntRepresentation = UInt64(bitPattern: Int64(Int(bitPattern: mhHeaderPtr)))
        var dataLoAddress = mhHeaderPtr_IntRepresentation + offset

        var dataLoAddressPtr = withUnsafePointer(to: &dataLoAddress) {
            return $0
        }

        var dataLoContent = UnsafePointer<UInt32>.init(bitPattern: Int(exactly: dataLoAddress) ?? 0)?.pointee
        print(dataLoContent)

        let typeDescOffset = UInt64(dataLoContent!) + offset - linkBaseAddress

        var typeDecAddress = typeDescOffset + mhHeaderPtr_IntRepresentation

        let classDesriptor = UnsafePointer<TargetClassDescriptor>.init(bitPattern: Int(exactly: typeDecAddress) ?? 0)?.pointee

        if let name = classDesriptor?.name {
            let nameOffset = Int64(name) + Int64(typeDescOffset) + 8
            print(nameOffset)
            let nameAddress = nameOffset + Int64(mhHeaderPtr_IntRepresentation)
            print(nameAddress)
            if let cChar = UnsafePointer<CChar>.init(bitPattern: Int(nameAddress)){
                print(String(cString: cChar))
            }
        }
    }
}

struct TargetClassDescriptor{
    var flags: UInt32
    var parent: UInt32
    var name: Int32
    var accessFunctionPointer: Int32
    var fieldDescriptor: Int32
    var superClassType: Int32
    var metadataNegativeSizeInWords: UInt32
    var metadataPositiveSizeInWords: UInt32
    var numImmediateMembers: UInt32
    var numFields: UInt32
    var fieldOffsetVectorOffset: UInt32
    var Offset: UInt32
    var size: UInt32
}

struct PointClass {
    var name: String = "abc"
    var age: Int = 18
    var sex: Bool = true
}

struct PointStruct {
    var age: Int
    var height: Double
}

class PointTeacher{
    var age: Int = 28
    var name: String = "dcjk"
}

func testPoint(_ p: UnsafePointer<Int8>) {
    print(p[0])
    print(p[1])
}

func testStructPoint(){
    // 分配2个 PointClass 大小的空间
    let ptr = UnsafeMutablePointer<PointClass>.allocate(capacity: 2)
    // 初始化第一个空间
    ptr.initialize(to: PointClass())
    // 移动，初始化第2个空间
    ptr[1] = PointClass(name: "abc", age: 18, sex: true)

    //访问方式一 下标访问
    print(ptr[0])
    print(ptr[1])

    //访问方式二 内存平移
    print(ptr.pointee)
    print((ptr+1).pointee)

    //访问方式三 successor()
    print(ptr.pointee)
    //successor 往前移动
    print(ptr.successor().pointee)

    //必须和分配是一致的
    ptr.deinitialize(count: 2)
    //释放
    ptr.deallocate()
}




