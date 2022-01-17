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


func test(_ a: Int, _ b: Int, _ c: Int, by:(_ item1: Int, _ item2: Int, _ item3: Int) -> Bool) -> Bool {
    return by(a,b,c)
}

test(10, 20, 30) { item1, item2, item3 in
    return item1+item2 < item3
}
