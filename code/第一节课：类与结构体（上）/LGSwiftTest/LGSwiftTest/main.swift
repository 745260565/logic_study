//
//  main.swift
//  LGSwiftTest
//
//  Created by hank on 2020/12/16.
//

import Foundation

var empty = "程浩"
withUnsafePointer(to: &empty){
    print($0)
}
print(empty.count)

var str = "adskl"
print(str.index(str.startIndex, offsetBy: 1))
print(empty)
