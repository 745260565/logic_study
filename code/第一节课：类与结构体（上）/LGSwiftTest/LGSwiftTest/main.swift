//
//  main.swift
//  LGSwiftTest
//
//  Created by hank on 2020/12/16.
//

import Foundation

class Teacher {
    // 只被初始化一次
    static var age: Int = 18
}

// 可以修改
Teacher.age = 30
Teacher.age = 20
