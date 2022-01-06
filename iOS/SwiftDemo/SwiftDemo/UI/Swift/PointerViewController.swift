//
//  PointerViewController.swift
//  SwiftDemo
//
//  Created by ChengHao on 2022/1/6.
//

import UIKit

class PointerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(MemoryLayout<PointClass>.size)
//        print(MemoryLayout<PointClass>.stride)//步长是16，内存对齐
//        print(MemoryLayout<PointClass>.alignment)
        
        //创建一个内存空间 4个8字节，步长8
//        let p = UnsafeMutableRawPointer.allocate(byteCount: 32, alignment: 8)
//        for i in 0..<4 {
//            p.advanced(by: i * MemoryLayout<Int>.stride).storeBytes(of: i, as: Int.self)
//        }
//        for i in 0..<4{
//            let value = p.load(fromByteOffset: i*8, as: Int.self)
//            print("index:\(i),value:\(value)")
//        }
        
        //得到变量内存指针
        var age = 18
        withUnsafePointer(to: &age) { ptr in
            print(ptr)
        }
        
        age = withUnsafePointer(to: &age) { ptr in
            return ptr.pointee + 21
        }
        print(age)
    }
}

struct PointClass {
    var max: String = "adsdfsfdsdd你好sfdfasdsac"
    var age: Int = 18
    var sex: Bool = true
}


