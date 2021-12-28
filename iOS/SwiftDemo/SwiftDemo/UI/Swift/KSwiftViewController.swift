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
        
        var t = Teacher()
        print("end")
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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

class Person{
    var age = 18
    var name = "mc"
}

class Teacher{
    var age = 18
    var name = "ch"
    var p = Person()
}

enum Color {
    case blue,green,gray
}


