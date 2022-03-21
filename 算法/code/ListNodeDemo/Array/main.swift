//
//  main.swift
//  Array
//
//  Created by chenghao on 2022/3/18.
//

import Foundation

print("Hello, World!")

func trap(_ height: [Int]) -> Int {
    
    if height.count < 3 {
        return 0
    }
    
    var sum = 0
    for i in 1 ..< height.count-1 {
        
        //左侧高度
        var max_left = 0
        for j in 0 ..< i {
            if max_left < height[j] {
                max_left = height[j]
            }
        }
        
        //右侧高度
        var max_right = 0
        for j in i+1 ..< height.count {
            if max_right < height[j] {
                max_right = height[j]
            }
        }
        
        if min(max_left, max_right) > height[i]{
            sum += min(max_left, max_right) - height[i]
        }
    }
    return sum
}

func trap2(_ height: [Int]) -> Int {
    
    let n = height.count
    if n < 3 {
        return 0
    }
    
    var leftMax = [Int].init(repeating: 0, count: n)
    
}

func removeDuplicates(_ nums: inout [Int]) -> Int {
    var s = Set<Int>()
    for i in 0..<nums.count {
        s.map(i)
    }
    return Array.init(s)
    
}

