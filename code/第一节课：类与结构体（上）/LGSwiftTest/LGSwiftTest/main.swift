//
//  main.swift
//  LGSwiftTest
//
//  Created by hank on 2020/12/16.
//

import Foundation

//实现一个单例
//class Teacher{
//    static let sharedInstance = Teacher()
//    private init(){}
//}

//class Subject: Teacher{
//
//}
//
//Subject.sharedInstance

//clas Teacher{
//    var age = 18
//
//    var name = "ch"
//}

//struct Teacher{
//    var age: Int = 18
//    var name: String = "ch"
//}
//
//var size: UInt = 0
//var ptr = getsectdata("__TEXT", "", &size)
//var mHeaderPtr = _dyld_get_image_header(0)





//var size: UInt = 0
////__swift5_types section 的pFile
//var ptr = getsectdata("__TEXT", "__swift5_types", &size)
////print(ptr)
////获取当前程序运行地址 0x0000000100000000
//var mhHeaderPtr = _dyld_get_image_header(0)
//var setCommond64Ptr = getsegbyname("__LINKEDIT")
//var linkBaseAddress: UInt64 = 0
//if let vmaddr = setCommond64Ptr?.pointee.vmaddr, let fileOff = setCommond64Ptr?.pointee.fileoff{
//    linkBaseAddress = vmaddr - fileOff
//}
//
//var offset: UInt64 = 0
//if let unwrappedPtr = ptr{
//    let intRepresentation = UInt64(bitPattern: Int64(Int(bitPattern: unwrappedPtr)))
//    offset = intRepresentation - linkBaseAddress
//}
//
////DataLo的内存地址
//let mhHeaderPtr_IntRepresentation = UInt64(bitPattern: Int64(Int(bitPattern: mhHeaderPtr)))
//
//var dataLoAddress = mhHeaderPtr_IntRepresentation + offset
////print(UnsafePointer<UInt32>.init(bitPattern: Int(exactly: dataLoAddress) ?? 0)?.pointee)
//
//var dataLoAddressPtr = withUnsafePointer(to: &dataLoAddress){return $0}
////print(dataLoAddressPtr)
//
//var dataLoContent = UnsafePointer<UInt32>.init(bitPattern: Int(exactly: dataLoAddress) ?? 0)?.pointee
//
//let typeDescOffset = UInt64(dataLoContent!) + offset - linkBaseAddress
//
//var typeDescAddress = typeDescOffset + mhHeaderPtr_IntRepresentation
//
////print(typeDescAddress)
//struct TargetClassDescriptor{
//    var flags: UInt32
//    var parent: UInt32
//    var name: Int32
//    var accessFunctionPointer: Int32
//    var fieldDescriptor: Int32
//    var superClassType: Int32
//    var metadataNegativeSizeInWords: UInt32
//    var metadataPositiveSizeInWords: UInt32
//    var numImmediateMembers: UInt32
//    var numFields: UInt32
//    var fieldOffsetVectorOffset: UInt32
//    var Offset: UInt32
//    var size: UInt32
//}


//枚举
//关联值
//enum Shap{
//    case circle(radious: Double)
//    case rectangle(width: Double, height: Double)
//}
//
//var circle = Shap.circle(radious: 10.0)

enum Enum{
    case one(Bool)
    case two
    case three
    case four
    case five
    case six
    case four_1
    case five_2
    case six_1
    case two_1
    case three_1
    case four_2
    case five_3
    case six_2
    case four_3
    case five_4
    case six_4
}

print(MemoryLayout<Enum>.size)
print(MemoryLayout<Enum>.stride)

//以最大关联值来开辟内存空间










































