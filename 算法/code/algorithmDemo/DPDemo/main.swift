//
//  main.swift
//  DPDemo
//
//  Created by chenghao on 2022/3/22.
//

import Foundation

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
}

