//
//  InitDeinitViewController.swift
//  SwiftDemo
//
//  Created by ChengHao on 2021/12/27.
//

import UIKit

class InitDeinitViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var p1:Person? = Person(name:"zhangsan",age:18)
        var p2:Person? = p1
        var p3:Person? = p2
        p1 = nil
        p2 = nil
        p3 = nil//此时计数器为0，调用析构函数
    }
    
    class Person {
        var name : String
        var age : Int

        init(name : String, age : Int) {
            print("调用构造函数")
            self.name = name
            self.age = age
        }

        deinit {
            print("调用析构函数")
            //释放资源
        }
    }
    
}




