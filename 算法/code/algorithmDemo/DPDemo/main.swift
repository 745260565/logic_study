//
//  main.swift
//  DPDemo
//
//  Created by chenghao on 2022/3/22.
//

import Foundation

let s = Solution()
s.uniquePaths(2, 1)

class Solution {
    //买卖股票的最佳时机 II
    func maxProfit(_ prices: [Int]) -> Int {
        if(prices.count == 1) {
            return 0
        }
        let n = prices.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n)
        // dp[i][0] 手中没有股票 dp[i][1] 手中有股票
        dp[0][0] = 0
        dp[0][1] = -prices[0]
        for i in 1..<n {
            dp[i][0] = max(dp[i-1][0],dp[i-1][1]+prices[i])
            dp[i][1] = max(dp[i-1][0]-prices[i],dp[i-1][1])
        }
        //最后一天手里没有股票收益最大
        return dp[n-1][0]
    }
    
    //上面计算的时候我们看到当天的利润只和前一天有关，没必要使用一个二维数组，只需要使用两个变量，一个记录当天交易完之后手里持有股票的最大利润，一个记录当天交易完之后手里没有股票的最大利润
    func maxProfit2(_ prices: [Int]) -> Int {
        if(prices.count == 1) {
            return 0
        }
        let n = prices.count
        var hold = -prices[0] //手里有股票
        var noHold = 0 //没有股票
        for i in 1..<n {
            noHold = max(noHold,hold+prices[i])
            hold = max(hold,noHold-prices[i])
        }
        return noHold
    }
    
    
    //BM62 斐波那契数列
    //https://www.nowcoder.com/practice/c6c7742f5ba7442aada113136ddea0c3?tpId=295&tqId=23255&ru=/exam/oj&qru=/ta/format-top101/question-ranking&sourceUrl=%2Fexam%2Foj
    
    func Fibonacci ( _ n: Int) -> Int {
        // write code here
        if n == 1 || n == 2 {
            return 1
        }
        var a = 1
        var b = 1
        
        for _ in 3...n {
            b = a + b
            a = b - a
        }
        return b
    }
    
    //BM64 最小花费爬楼梯
    //https://www.nowcoder.com/practice/6fe0302a058a4e4a834ee44af88435c7?tpId=295&tqId=2366451&ru=%2Fpractice%2Fc6c7742f5ba7442aada113136ddea0c3&qru=%2Fta%2Fformat-top101%2Fquestion-ranking&sourceUrl=%2Fexam%2Foj
    func minCostClimbingStairs ( _ cost: [Int]) -> Int {
// write code here
        if cost.count == 1 {
            return 0
        }
        var a = cost[0]
        var b = cost[1]
        var c = 0
        for i in 2..<cost.count{
            c = min(a+cost[i],b+cost[i])
            a = b
            b = c
        }
        return min(a,b)
    }
    
    //BM67 不同路径的数目(一)
    //https://www.nowcoder.com/practice/166eaff8439d4cd898e3ba933fbc6358?tpId=295&tqId=685&ru=/exam/oj&qru=/ta/format-top101/question-ranking&sourceUrl=%2Fexam%2Foj
    func uniquePaths ( _ m: Int,  _ n: Int) -> Int {
        // write code here
        if m == 1 && n == 1 {
            return 1
        }
        var array = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        var i = 0,j = 0
        while(i<m) {
            while(j<n) {
                if i == 0 && j == 0 {
                    array[i][j] = 0
                } else if i == 0 || j == 0 {
                    array[i][j] = 1
                } else {
                    array[i][j] = array[i-1][j] + array[i][j-1]
                }
                j += 1
            }
            i += 1
            j = 0
        }
        return array[m-1][n-1]
    }
    
    //BM81 买卖股票的最好时机(二)
    //https://www.nowcoder.com/practice/9e5e3c2603064829b0a0bbfca10594e9?tpId=295&tqId=1073471&ru=/exam/oj&qru=/ta/format-top101/question-ranking&sourceUrl=%2Fexam%2Foj
    //使用两个变量，一个记录当天交易完之后手里持有股票的最大利润，一个记录当天交易完之后手里没有股票的最大利润
    func maxProfit3 ( _ prices: [Int]) -> Int {
        // write code here
        if prices.count <= 0 {
            return 0
        }
        var hold = -prices[0] //手里有股票最大收益
        var noHold = 0 //手里没有股票最大收益
        for i in 1..<prices.count {
            hold = max(hold, noHold-prices[i])
            noHold = max(hold+prices[i],noHold)
        }
        return noHold
    }
    
    //BM82 买卖股票的最好时机(三)
    //https://www.nowcoder.com/practice/4892d3ff304a4880b7a89ba01f48daf9?tpId=295&tqId=1073487&ru=%2Fpractice%2F9e5e3c2603064829b0a0bbfca10594e9&qru=%2Fta%2Fformat-top101%2Fquestion-ranking&sourceUrl=%2Fexam%2Foj
    //   假设你有一个数组prices，长度为n，其中prices[i]是某只股票在第i天的价格，请根据这个价格数组，返回买卖股票能获得的最大收益
    //    1. 你最多可以对该股票有两笔交易操作，一笔交易代表着一次买入与一次卖出，但是再次购买前必须卖出之前的股票
    //    2. 如果不能获取收益，请返回0
    //    3. 假设买入卖出均无手续费
//    func maxProfit4 ( _ prices: [Int]) -> Int {
//        // write code here
//    }
    
    //BM72 连续子数组的最大和
    //https://www.nowcoder.com/practice/459bd355da1549fa8a49e350bf3df484?tpId=295&tqId=23259&ru=/exam/oj&qru=/ta/format-top101/question-ranking&sourceUrl=%2Fexam%2Foj
    func FindGreatestSumOfSubArray ( _ array: [Int]) -> Int {
        // write code here
        let count = array.count
        var dp = [Int].init(repeating: 0, count: count)
        var ret = array[0]
        for (index,_) in array.enumerated() {
            if index > 0 {
                dp[index] = max(array[index-1], dp[index-1]+array[index-1])
                ret = max(ret, dp[index])
            }
        }
        return ret
    }
}

