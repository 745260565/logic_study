//
//  KSwiftViewController.swift
//  SwiftDemo
//
//  Created by ChengHao on 2021/12/28.
//

import UIKit
import Darwin

class KSwiftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        self.view.backgroundColor = UIColor.systemBackground
        
        var t = LGTeacher()
        //获取实例对象的指针
        let objcRawPtr = Unmanaged.passUnretained(t as AnyObject).toOpaque()
        let objcPtr = objcRawPtr.bindMemory(to: HeapObject.self, capacity: 1)
        print(objcPtr.pointee)
        let metatata = objcPtr.pointee.metadata.bindMemory(to: Metadata.self, capacity: MemoryLayout<Metadata>.stride).pointee
    
        print(metatata)
        print("end")
    }
}


//Mark: Day1

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

class SubTeacher: Teacher{
    var subjectName: String
    init(_ subjectName: String) {
        self.subjectName = subjectName
        super.init(20,"ch")
    }
}

class Teacher{
    var age: Int
    var name: String
    
    init(_ age: Int, _ name: String){
        self.age = age;
        self.name = name;
    }
    
    convenience init(_ age: Int){
        self.init(age, "")
        self.age = age
        self.name = ""
    }
    
    convenience init(_ name: String){
        self.init(20,name)
        self.age = 20
        self.name = "ch"
    }
}

class LGTeacher{
    var age: Int = 18
    var name: String = "ch"
}

struct HeapObject{
    var metadata: UnsafeRawPointer
    var refcounted1: UInt32
    var refcounted2: UInt32
}

//获取实例对象的指针
//let objcRawPtr = Unmanaged.passUnretained(t as AnyObject).toOpaque()
//let objcPtr = objcRawPtr.bindMemory(to: HeapObject.self, capacity: 1)
//print(objcPtr.pointee)
//print("end")


