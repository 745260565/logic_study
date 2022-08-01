//
//  main.swift
//  AlgorithmDemo
//
//  Created by chenghao on 2022/3/22.
//

import Foundation

print("Hello, World!")

print(isAnagram("rat","car"))

func isAnagram(_ s: String, _ t: String) -> Bool {
//    var r : Int = 0
//    for c1 in s {
//        r = r^Int(c1.asciiValue!)
//    }
//
//    for c2 in t {
//        r = r^Int(c2.asciiValue!)
//    }
//    return r == 0
    var sArray : [Int] = [Int](repeating: 0, count: 26)
    var tArray : [Int] = [Int](repeating: 0, count: 26)
    for c1 in s {
        sArray[Int(c1.asciiValue!) - Int(Character("a").asciiValue!)] += 1
    }
    for c2 in t {
        tArray[Int(c2.asciiValue!) - Int(Character("a").asciiValue!)] += 1
    }
    for i in 0..<26 {
        if sArray[i] != tArray[i] {
            return false
        }
    }
    return true
}
