//
//  main.swift
//  StringDemo
//
//  Created by chenghao on 2022/3/24.
//

import Foundation


while let line = readLine() {
    let parts = line.split(separator: " ")
    print(output(s: String(parts[0])))
}

func output(s: String) -> String{
    let chs : [Character] = s.map{$0}
    var s : [Character] = []
    for ch in chs {
        if s.count == 0 || s.last != ch {
            s.append(ch)
        } else {
            s.removeLast()
        }
    }
    return s.count == 0 ? "0" : String(s)
}

//BM83 字符串变形
//https://www.nowcoder.com/practice/c3120c1c1bc44ad986259c0cf0f0b80e?tpId=295&tqId=44664&ru=%2Fpractice%2F9e5e3c2603064829b0a0bbfca10594e9&qru=%2Fta%2Fformat-top101%2Fquestion-ranking&sourceUrl=%2Fexam%2Foj
func trans ( _ s: String,  _ n: Int) -> String {
    // write code here
    var array = s.split(separator: " ")
    for (idx, string) in array.enumerated() {
        if idx <= array.count/2 {
            array[idx] = array[array.count-1-idx]
            array[array.count-1-idx] = string
        }
    }
    return array.joined(separator: " ")
}
