//
//  KSwiftViewController.swift
//  SwiftDemo
//
//  Created by ChengHao on 2021/12/28.
//

import UIKit

class KSwiftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.systemBackground
        
        var t = Teacher("ch")
        print("end")
        
        var m = M()
        var a = S(m: m)
        var b = a
        a.m.k = 2
        a.num = 5
        print(b.m.k)
        print(b.num)
        
    }
}

struct S{
    var num = 3
    var m:M
}

class M{
    var k = 4
}



//class Teacher{
//    var age: Int
//    var name: String
//
//    init(age: Int, name: String) {
//        self.age = age;
//        self.name = name
//    }
//
//    deinit{
//
//    }
//}

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


