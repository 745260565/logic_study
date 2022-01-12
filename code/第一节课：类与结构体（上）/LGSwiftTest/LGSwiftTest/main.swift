//
//  main.swift
//  LGSwiftTest
//
//  Created by hank on 2020/12/16.
//

import Foundation

struct Point {
    var x = 0.0, y = 0.0
    
    func test(){
        let z = self.x
    }
    
    mutating func moveBy(x deltax: Double,y deltaY:Double) {
        x += deltax
        y += deltaY
    }
}







































