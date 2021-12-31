//
//  KSwiftViewController.swift
//  SwiftDemo
//
//  Created by ChengHao on 2021/12/28.
//

import UIKit
import Darwin

class KSwiftViewController: UIViewController {
    
    var tableView:UITableView!
    var titles = ["函数的调用"]
    let identifier = "resuedCell"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        self.view.backgroundColor = UIColor.systemBackground
        
        setUpView()
        
//        var t = LGTeacher()
//        //获取实例对象的指针
//        let objcRawPtr = Unmanaged.passUnretained(t as AnyObject).toOpaque()
//        let objcPtr = objcRawPtr.bindMemory(to: HeapObject.self, capacity: 1)
//        print(objcPtr.pointee)
//        let metatata = objcPtr.pointee.metadata.bindMemory(to: Metadata.self, capacity: MemoryLayout<Metadata>.stride).pointee
//
//        print(metatata)
//        print("end")
    }
    
    func setUpView(){
        self.tableView = UITableView(frame: self.view.frame, style: .plain)
        print(self.view.frame)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.view.addSubview(tableView)
    }
}

extension KSwiftViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = titles[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(SwiftMethodViewController(), animated: false)
        default:
            break
        }
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


