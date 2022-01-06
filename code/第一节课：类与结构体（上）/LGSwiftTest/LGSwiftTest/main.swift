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

struct Teacher{
    var age: Int = 18
    var name: String = "ch"
}

var size: UInt = 0
var ptr = getsectdata("__TEXT", "", &size)
var mHeaderPtr = _dyld_get_image_header(0)









































