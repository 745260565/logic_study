//
//  main.swift
//  LGSwiftTest
//
//  Created by hank on 2020/12/16.
//

import Foundation

//func addTwoInts(_ a: Int, _ b: Int) -> Int{
//    return a + b
//}
//
//func addTwoInts(_ a: Double, _ b: Double) -> Double{
//    return a + b
//}


//闭包本质：
//闭包本质是一个结构体，数据结构是:闭包的执行地址+捕获变量堆空间的地址
struct ClosureData<Box>{
    var unkown: UnsafeRawPointer
    var object: HeapObject<Box>
}

struct HeapObject{
    var metadata: UnsafeRawPointer
    var refcount1: Int32
    var refcount2: Int32
}

struct Box<T>{
    var object:HeapObject
    var value: T
}

