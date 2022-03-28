//
//  main.swift
//  ArrayDemo
//
//  Created by chenghao on 2022/3/22.
//

import Foundation

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

//func trap2(_ height: [Int]) -> Int {
//
//    let n = height.count
//    if n < 3 {
//        return 0
//    }
//
//    var leftMax = [Int].init(repeating: 0, count: n)
//
//}

//func removeDuplicates(_ nums: inout [Int]) -> Int {
//    var s = Set<Int>()
//    for i in 0..<nums.count {
//        s.map(i)
//    }
//    return Array.init(s)
//
//}

//BM84 最长公共前缀
//https://www.nowcoder.com/practice/28eb3175488f4434a4a6207f6f484f47?tpId=295&tqId=732&ru=%2Fpractice%2F508378c0823c423baa723ce448cbfd0c&qru=%2Fta%2Fformat-top101%2Fquestion-ranking&sourceUrl=%2Fexam%2Foj%3Ftab%3D%25E7%25AE%2597%25E6%25B3%2595%25E7%25AF%2587%26topicId%3D295
//func longestCommonPrefix ( _ strs: [String]) -> String {
//    // write code here
//
//}

//BM51 数组中出现次数超过一半的数字
//https://www.nowcoder.com/practice/e8a1b01a2df14cb2b228b30ee6a92163?tpId=295&tqId=23271&ru=%2Fpractice%2Fff05d44dfdb04e1d83bdbdab320efbcb&qru=%2Fta%2Fformat-top101%2Fquestion-ranking&sourceUrl=%2Fexam%2Foj%3Ftab%3D%25E7%25AE%2597%25E6%25B3%2595%25E7%25AF%2587%26topicId%3D295
func MoreThanHalfNum_Solution ( _ numbers: [Int]) -> Int {
    // write code here
    var array : [Int] = []
    for number in numbers {
        if array.count == 0 || array.last == number{
            array.append(number)
        } else {
            array.removeLast()
        }
    }
    return array.count == 0 ? 0 : array[0]
}

