//
//  OperationViewController.swift
//  SwiftDemo
//
//  Created by ChengHao on 2022/1/10.
//

import UIKit

////第五节课-Opetation
class OperationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var x = Vector(x:10,y:20)
//        var y = Vector(x:12,y:30)
//        var z = x + y
//        print(z)
        
        
        //隐式可选类型！
        var age: Int
        var age1: Int!
        var age2: Int?
        
        let x = age1%2
        let y = age2!%2
        
        // Do any additional setup after loading the view.
    }
}

struct Vector{
    let x:Int
    let y:Int
}

//运算符重载
extension Vector {
    static func + (firstVector: Vector, secondVerctor: Vector) -> Vector {
        return Vector(x:firstVector.x + secondVerctor.x, y: firstVector.y + secondVerctor.y)
    }
    
    //前缀运算符
    static prefix func - (vector:Vector) -> Vector {
        return Vector(x: -vector.x,y: -vector.y)
    }
    
    static func - (firstVector: Vector, secondVector: Vector) -> Vector {
        return firstVector + -secondVector
    }
}


