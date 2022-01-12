//
//  LGMirriorViewController.swift
//  SwiftDemo
//
//  Created by ChengHao on 2022/1/11.
//

import UIKit

////第六节课-反射

class LGMirriorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var t = Teacher()
        //T.self:T是实例对象，当前T.self返回的就是本身，如果T是类，T.self返回的就是元类型
//        var t1: AnyObject = t
//        var t2: AnyObject = Teacher.self
        
//        var t1 = t.self
//        var t2 = t.self.self
//        var t3 = Teacher.self
        
//        //首先通过构造方法构建一个Mirror实例，这里伟入的参数是Any,也就意味着当前可以是类，结构体，枚举等
//        let mirror = Mirror(reflecting: t)
//        //遍历children属性，这是一个集合
//        for pro in mirror.children {
//            //然后可以直接通过lavel输出当前的名称，value输出当前反射的值
//            print("\(pro.label):\(pro.value)")
//        }
        
        
        //test函数调用mirror解析
//        print(test(t))
        
        //Teacher遵守协议
//        var t1 = try? t.jsonMap()
//        print(t1)
        do{
            let t1 = try t.jsonMap()
            print(t1)
        }catch{
            print(error)
        }
    }
    

    class Teacher:JSONMap{
        var age = 18
        var name = "ch"
    }
    
    //Self的使用，Self在返回值中表示当前对象
    class Teacher_1{
        static let age = 18
        
        func test() -> Self {
            return self
        }
    }
    
    class Person: MyProtocol {
        func get() -> Self {
            return self
        }
    }
    
    class Person1 {
        static let age = 0
//        let age1 = Self.age
        var age2 = age
        lazy var age3 = Self.age
    }
    
    //Mirror解析
    func test(_ mirrorObj: Any) -> Any {
        let mirror = Mirror(reflecting: mirrorObj)
        guard !mirror.children.isEmpty else {return mirrorObj}
        var result: [String: Any] = [:]
        for child in mirror.children {
            if let key = child.label {
                result[key] = test(child.value)
            }else{
                print("No Keys")
            }
        }
        return result
    }
}


protocol MyProtocol {
    func get() -> Self
}

protocol JSONMap{
    func jsonMap() throws -> Any
}

extension JSONMap{
    func jsonMap() throws -> Any{
        let mirror = Mirror(reflecting: self)
        guard !mirror.children.isEmpty else { return self}
        var result: [String: Any] = [:]
        for child in mirror.children{
            if let value = child.value as? JSONMap {
                if let key = child.label{
                    result[key] = try! value.jsonMap()
                } else {
//                    print("No Keys")
                    JSONMapError.emtpyKey
                }
            }else{
//                print("Value not conform JSONMap Protocol")
                JSONMapError.noConformProtocol
            }
        }
        return result
    }
}

extension Teacher: JSONMap{}
extension Int: JSONMap{}
//extension String: JSONMap{}

enum JSONMapError: Error {
    case emtpyKey
    case noConformProtocol
}
