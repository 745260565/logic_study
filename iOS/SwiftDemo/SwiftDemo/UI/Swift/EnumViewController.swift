//
//  EnumViewController.swift
//  SwiftDemo
//
//  Created by chenghao on 2022/1/9.
//

import UIKit

class EnumViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(DayOfWeek.mon.rawValue)
//        print(DayOfWeek.tur.rawValue)
//        print(DayOfWeek.wed.rawValue)
//        print(DayOfWeek.thu.rawValue)
//        print(DayOfWeek.fri.rawValue)
//        print(DayOfWeek.sat.rawValue)
//        print(DayOfWeek.sun.rawValue)
        
//        print(DayOfWeek.init(rawValue: "mon"))
//        print(DayOfWeek.init(rawValue: "Hello"))
    
        
//        var circle = Shap.circle(radious: 10.0)
//        var a = Week.MONDAY
//        var b = Week.THUDAY
//        var c = Week.WEDDAY
//        print(MemoryLayout<Week>.size)
        
        print(MemoryLayout<Enum>.size)
        print(MemoryLayout<Enum>.stride)
        
        // Do any additional setup after loading the view.
    }
    
//    enum DayOfWeek: Int{
//        case mon,tur,wed,thu,fri = 10,sat,sun
//    }
    
    //枚举是值类型
    
    //默认给每一个枚举分配了一个rawValue
    enum DayOfWeek: String{
        case mon,tur,wed,thu,fri = "Hello World",sat,sun
    }
    
    //关联值
    enum Shap{
        case circle(radious: Double)
        case rectagele(width:Double,Height:Double)
    }
    
    //默认以Int8字节存储，即1字节
    enum Week{
        case MONDAY,THEDAY,WEDDAY,THUDAY,FRIDAY,SATDAY,SUNDAY
    }
    
    enum Enum{
        case test_one(Int,Int,Int)
        case test_two(Int)
        case test_three
        case test_four
    }
    
}
