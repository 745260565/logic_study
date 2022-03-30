//
//  main.swift
//  MathDemo
//
//  Created by chenghao on 2022/3/30.
//

import Foundation

print("Hello, World!")

//NC32 求平方根
//https://www.nowcoder.com/practice/09fbfb16140b40499951f55113f2166c?tpId=117&tqId=37734&rp=1&ru=/exam/oj&qru=/exam/oj&sourceUrl=%2Fexam%2Foj%3Ftab%3D%25E7%25AE%2597%25E6%25B3%2595%25E7%25AF%2587%26topicId%3D117&difficulty=undefined&judgeStatus=undefined&tags=&title=
func sqrt ( _ x: Int) -> Int {
    // write code here
    var left = 1
    var right = x
    while(right>=left) {
        var mid = (left + right)/2
        if mid<=x/mid && (mid+1)>x/(mid+1) {
            return mid
        }else if mid>x/mid  {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    return 0
}

