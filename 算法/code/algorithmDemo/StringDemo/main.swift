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
