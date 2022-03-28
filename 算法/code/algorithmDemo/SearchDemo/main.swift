//
//  main.swift
//  SearchDemo
//
//  Created by chenghao on 2022/3/22.
//

import Foundation

//BM17 二分查找-I
//https://www.nowcoder.com/practice/d3df40bd23594118b57554129cadf47b?tpId=295&tqId=1499549&ru=%2Fpractice%2F5e2135f4d2b14eb8a5b06fab4c938635&qru=%2Fta%2Fformat-top101%2Fquestion-ranking&sourceUrl=%2Fexam%2Foj

func search ( _ nums: [Int],  _ target: Int) -> Int {
// write code here
    if nums.count == 0 {
        return -1
    }
    var left = 0
    var right = nums.count-1
    while(left<=right) {
        let mid = (left + right)/2
        if(nums[mid] == target){
            return mid
        }else if(nums[mid] < target){
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    return -1
}

