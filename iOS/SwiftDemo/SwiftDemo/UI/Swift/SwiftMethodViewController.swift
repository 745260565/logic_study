//
//  SwiftMethodViewController.swift
//  SwiftDemo
//
//  Created by ChengHao on 2021/12/31.
//

import UIKit

class SwiftMethodViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.systemBackground
        
        let t = CHTeacher()
        t.teach()
        t.teach1()
        t.teach2()

        // Do any additional setup after loading the view.
    }
}
 
class CHTeacher{
     @objc dynamic func teach(){
        print("teach")
    }
    
    func teach1(){
        print("teach1")
    }
    
    func teach2(){
        print("teach2")
    }
}
