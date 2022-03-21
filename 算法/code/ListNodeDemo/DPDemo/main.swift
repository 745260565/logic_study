//
//  main.swift
//  DPDemo
//
//  Created by chenghao on 2022/3/21.
//

import Foundation

print("Hello, World!")




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
}
