//
//  main.swift
//  ArrayDemo
//
//  Created by chenghao on 2022/3/22.
//

import Foundation

print(merge2([[1,4],[0,4]]))


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

//4. 寻找两个正序数组的中位数
//https://leetcode-cn.com/problems/median-of-two-sorted-arrays/
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    if nums1.count == 0 && nums2.count == 0 {
        return 0
    }
    let l1 = nums1.count
    let l2 = nums2.count
    var array = [Int]()
    var i1 = 0, i2 = 0
    while(array.count < (l1+l2)/2 + 1) {
        if i1<l1 && i2<l2 {
            if nums1[i1]<nums2[i2] {
                array.append(nums1[i1])
                i1 += 1
            } else {
                array.append(nums2[i2])
                i2 += 1
            }
        } else {
            if i1 >= l1 {
                array.append(nums2[i2])
                i2 += 1
            }else if i2 >= l2 {
                array.append(nums1[i1])
                i1 += 1
            }
        }
    }
    if (l1+l2)%2 == 0 {
        return ((Double)(array.last! + array[array.count-2]))/2
    } else {
        return Double(array.last!)
    }
}

//BM46 最小的K个数
//https://www.nowcoder.com/practice/6a296eb82cf844ca8539b57c23e6e9bf?tpId=295&tqId=23263&ru=/exam/oj&qru=/ta/format-top101/question-ranking&sourceUrl=%2Fexam%2Foj
func GetLeastNumbers_Solution ( _ input: [Int],  _ k: Int) -> [Int] {
    // write code here
    let sortInput = input.sorted()
    if k >= input.count {
        return input
    }
    var array = [Int]()
    var i = 0
    while i<k {
        array.append(sortInput[i])
        i += 1
    }
    return array
}

//BM87 合并两个有序的数组
func merge ( _ A: inout [Int],  _ m: Int,  _ B: [Int],  _ n: Int) {
    // write code here
    var i:Int = m - 1
    var j:Int = n - 1
    var k:Int = m+n-1
    while i >= 0 && j >= 0 {
        if A[i] > B[j] {
            A[k] = A[i]
            i -= 1
            k -= 1
        } else {
            A[k] = B[j]
            j -= 1
            k -= 1
        }
    }
    while j >= 0 {
        A[k] = B[j]
        j -= 1
        k -= 1
    }
}

//BM21 旋转数组的最小数字
//https://www.nowcoder.com/practice/9f3231a991af4f55b95579b44b7a01ba?tpId=295&tqId=23269&ru=/exam/oj&qru=/ta/format-top101/question-ranking&sourceUrl=%2Fexam%2Foj
func minNumberInRotateArray ( _ rotateArray: [Int]) -> Int {
    // write code here
    var left = 0
    var right = rotateArray.count - 1
    while(left < right) {
        let mid = (left + right)/2
        if rotateArray[mid] > rotateArray[right] {
            left = mid + 1
        } else if rotateArray[mid] == rotateArray[right] { //相等无法区分
            right -= 1
        } else {
            right = mid
        }
    }
    return rotateArray[left]
}

func peakIndexInMountainArray(_ arr: [Int]) -> Int {
    var l = 0
    var r = arr.count - 1
    var ans = (l + r)/2
    while !((arr[ans] > arr[ans + 1]) && (arr[ans] > arr[ans - 1])) {
        if arr[ans] < arr[ans + 1] {
            l = ans + 1
        } else {
            r = ans - 1
        }
        ans = (l + r)/2
    }
    return ans
}

func merge2(_ intervals: [[Int]]) -> [[Int]] {
    var array = intervals
    array.sort { $0[0] < $1[0]}
    var i = 0
    while i < array.count-1 {
        if array[i][1] >= array[i+1][0] { //合并成一个，i不变
            array[i] = [array[i][0],max(array[i][1], array[i+1][1])]
            array.remove(at: i+1)
        } else { //不合并，i加1
            i += 1
        }
    }
    return array
}

