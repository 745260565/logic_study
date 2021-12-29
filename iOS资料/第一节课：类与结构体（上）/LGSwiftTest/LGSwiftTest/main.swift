//
//  main.swift
//  LGSwiftTest
//
//  Created by hank on 2020/12/16.
//

//import Foundation

//struct LGTeacher{
//    var age: Int
//    var name: String
//
//    init(age: Int, name: String) {
//        self.age = age
//        self.name = name
//    }
//}
//
//
//var t = LGTeacher(age: 18, name: "Kody")
//
//var t1 = t
//
//t1.age = 20
//
//print("end")

//class LGPerson{
//    var age = 18
//    var name = "LGMan"
//}



//成员变量访问安全
//class LGTeacher: LGPerson{
//    var subjectName: String
//
//    init(_ subjectName: String){
//
//        self.subjectName = subjectName
//
//        super.init(18, "lg")
//    }
//}

//let x = Int8(100) + 100
//swift_allocObject()

struct HeapObject{
    var metadata: UnsafeRawPointer
    var refcounted1: UInt32
    var refcounted2: UInt32
}

struct Metadata{
    var kind: Int
    var superClass: Any.Type
    var cacheData: (Int, Int)
    var data: Int
    var classFlags: Int32
    var instanceAddressPoint: UInt32
    var instanceSize: UInt32
    var instanceAlignmentMask: UInt16
    var reserved: UInt16
    var classSize: UInt32
    var classAddressPoint: UInt32
    var typeDescriptor: UnsafeMutableRawPointer
    var iVarDestroyer: UnsafeRawPointer
}


class LGTeacher{
  var age: Int = 18
  var name: String = "LG"
    
    //外部参数
    //内部参数
    init( age: Int, metadataname: String) {
        self.age = age
        self.name = name
    }
}

//var t = LGTeacher.init(Age: <#T##Int#>, Name: <#T##String#>)

let objcRawPtr = Unmanaged.passUnretained(t as AnyObject).toOpaque()
let objcPtr = objcRawPtr.bindMemory(to: HeapObject.self
    , capacity: 1)
print(objcPtr.pointee)

let metadata = objcPtr.pointee.metadata.bindMemory(to: Metadata.self, capacity: MemoryLayout<Metadata>.stride).pointee

print(metadata)

print("end")

//006-





































