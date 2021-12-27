//
//  ClosureViewController.swift
//  SwiftDemo
//
//  Created by ChengHao on 2021/6/25.
//

import UIKit

class ClosureViewController: UIViewController {
    
    var fn = {
        (v1: Int,v2: Int) -> Int in return v1 + v2
    }
        
    var arr = [2,4,1,45,23,12,43]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "闭包"
        
        print(fn(10,20))
        
//        arr.sort(by: temp(v1:v2:))
        
        //temp函数对应的闭包表达式形式：
//        arr.sort { (v1, v2) -> Bool in
//            v1 >= v2
//        }
        
        //根据上下文推断参数类型和返回类型 省掉返回类型和参数类型
//        arr.sort(by: {v1, v2 in return v1 >= v2})
        
        //单表达式闭包的隐式返回 单行表达式闭包可以通过省略 return
//        arr.sort(by: {v1, v2 in v1 >= v2})
        
        //参数名称缩写 Swift自动为内联闭包提供了参数名称缩写功能，你可以直接通过 $0，$1，$2... 来顺序调用闭包的参数。
//        arr.sort(by: {$0 >= $1})
        
        //运算符方法
//        arr.sort(by: >=)
        
        //尾随闭包 如果将一个闭包表达式作为函数的最后一个参数，使用尾随闭包可以增强可读性
//        arr.sort(){$0 >= $1}
        
        //如果闭包表达式作为函数的唯一实参，并且使用了尾随闭包，则函数名后面的小括号可以省略
//        arr.sort{$0 >= $1}
        
        print(arr)
        
//        getFirstPositive(v1: 10, v2: getNum())
//        getFirstPositive(11, {getNum()})
        getFirstPositive(11, getNum())
        // Do any additional setup after loading the view.
    }
    
    func temp(v1: Int,v2: Int) -> Bool {
        return v1 >= v2
    }
    
    var completionHandlers: [() -> Void] = []

    func someFunctionWithEsapingClosure(completionHandler: @escaping () -> Void) {
        completionHandlers.append(completionHandler)
    }

    func someFunctionWithNonescapingClosure(closure: () -> Void) {
        closure()
    }
    

    //当闭包作为一个实际参数传递给一个函数的时候，并且它会在函数返回之后调用，我 们就说这个闭包逃逸了。当你声明一个接受闭包作为形式参数的函数时，你可以在形 式参数前写 @escaping 来明确闭包是允许逃逸的。闭包可以逃逸的一种方法是被储存在定义于函数外的变量里。比如说，很多函数接收 闭包实际参数来作为启动异步任务的回调。函数在启动任务后返回，但是闭包要直到 任务完成——闭包需要逃逸，以便于稍后调用。
//    class SomeClass {
//        var x = 10
//        func doSomething() {
//            someFunctionWithEsapingClosure{
//                self.x = 100
//            }
//            someFunctionWithNonescapingClosure {
//                x = 100
//            }
//        }
//    }
    
    
    //自动闭包让你能够延迟求值，因为直到你调用这个闭包，代码段才会被执行。通过 @autoclosure 标志标记它的形式参数使用了自动闭包
    func getNum() -> Int {
        let a = 10
        let b = 11
        print("调用")
        return a+b
    }
    
//    func getFirstPositive(v1: Int, v2: Int) -> Int {
//        return v1 > 10 ? v1 : v2
//    }
    func getFirstPositive(_ v1: Int, _ v2: @autoclosure () -> Int) -> Int {
        return v1 > 10 ? v1 : v2()
    }
    
}




