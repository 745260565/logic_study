//
//  main.swift
//  MathDemo
//
//  Created by chenghao on 2022/3/30.
//

import Foundation

let m = 9
let n = 6
let a = greatestCommonDivisor(m: m, n: n)
let b = leastCommonMultiple(m: m, n: n)
print("\(m),\(n)的最大公约数是:\(a),最小公倍数是:\(b)")

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

//辗转相除法得到最大公约数
func greatestCommonDivisor(m: Int, n: Int) -> Int {
    var min = min(m, n)
    var max = max(m, n)
    var temp = 0
    while max%min != 0 {
        temp = max%min
        max = min
        min = temp
    }
    return min
}

//最小公倍数 = 两数乘积除以最大公约数
func leastCommonMultiple(m: Int, n: Int) -> Int {
    return m*n/greatestCommonDivisor(m: m, n: n)
}

///BM98 螺旋矩阵
///https://www.nowcoder.com/practice/7edf70f2d29c4b599693dc3aaeea1d31?tpId=295&tqId=693&ru=%2Fpractice%2F5e2135f4d2b14eb8a5b06fab4c938635&qru=%2Fta%2Fformat-top101%2Fquestion-ranking&sourceUrl=%2Fexam%2Foj
func spiralOrder ( _ matrix: [[Int]]) -> [Int] {
    // write code here
    var res: [Int] = []
    if matrix.count == 0 {
        return res
    }
    //定义四个指针，充当边界
    var top = 0, bottom = matrix.count - 1
    var left = 0, right = matrix[0].count - 1
    while top < (matrix.count + 1)/2 && left < (matrix[0].count + 1)/2 {
        //上面 左到右
        for (index,i) in matrix[top].enumerated() {
            
        }
    }
    
}



