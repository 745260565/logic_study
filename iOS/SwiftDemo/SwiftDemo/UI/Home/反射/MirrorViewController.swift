//
//  MirrorViewController.swift
//  SwiftDemo
//
//  Created by ChengHao on 2021/7/2.
//

import UIKit

class MirrorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "反射"
        // Do any additional setup after loading the view.
//        test()
        test2()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func test() {
        let obj: childerenClass = childerenClass()
        let morror = Mirror.init(reflecting: obj)
        let supporMorror = Mirror.init(reflecting: obj).superclassMirror
        for (name,value) in (supporMorror?.children)! {//获取父类的属性和值
            print("父类属性名:\(String(describing: name)) 值: \(value)")
        }
        print("获取父类对象类型:\(String(describing: supporMorror?.subjectType))")
        for (name,value) in (morror.children) {//获取子类类的属性和值
            print("子类属性名:\(String(describing: name)) 值: \(value)")
        }
        print("获取子类对象类型:\(String(describing: morror.subjectType))")
        
        for p in morror.children {
            let propertyNameString = p.label! // 属性名使用!,label是optional类型,要强制解包
            let value = p.value
            let vMirror = Mirror(reflecting: value)
            print("属性\(propertyNameString)类型为:\(vMirror.subjectType)")
        }
        
        for p in (supporMorror?.children)! {
            let propertyNameString = p.label! // 属性名使用!,label是optional类型,要强制解包
            let value = p.value
            let vMirror = Mirror(reflecting: value)
            print("属性\(propertyNameString)类型为:\(vMirror.subjectType)")
        }
    }
    
    func test2() {
        // 创建一个User实例对象模型
        let user1 = User()
        user1.name = "程浩"
        user1.age = 100
        user1.emails = ["abc@qq.com","sdkfl@qq.com"]
        let tel1 = Telephone(title: "手机", number: "14727348237")
        let tel2 = Telephone(title: "座机", number: "0713-293498")
        user1.tels = [tel1,tel2]
        
        //模型转字典
        if let model = user1.toJSONModel() {
            print(model)
        }
        
    }

}

//分别获取父亲和子类的属性值
class fatherClass: NSObject {
    var name: String = "fuMName"
    var qq: String = "fuQQ"
}

class childerenClass: fatherClass {
    var age: Int = 50
    var set: Bool = true
}

class User {
    var name: String = ""
    var nickname: String?
    var age:Int?
    var emails:[String]?
    var tels:[Telephone]?
}

struct Telephone {
    var title:String // 电话标题
    var number:String // 电话号码
}

//自定义一个JSON协议
protocol Sam_JSON {
    func toJSONModel() -> Any?
}

// 扩展协议方法,实现一个通用的toJSONModel方法（反射实现）
extension Sam_JSON {
    // 将模型数据转成可用的字典数据,Any表示任何类型,除了方法类型
    func toJSONModel() -> Any? {
        // 根据实例创建反射结构体Mirror
        let mirror = Mirror(reflecting: self)
        
        if mirror.children.count > 0 {
            // 创建一个空字典,用于后面添加键值对
            var result : [String:Any] = [:]
            for (idx, children) in mirror.children.enumerated() {
                let propertyNameString = children.label ?? "item\(idx)"
                let value = children.value
                // 判断value的类型是否遵循JSON协议,进行深度递归调用
                if let jsonValue = value as? Sam_JSON {
                    result[propertyNameString] = jsonValue.toJSONModel()
                }
            }
            return result
        }
        return self
    }
}

// 扩展可选类型,使其遵循JSON协议,可选类型值为nil时,不转化进字典中
extension Optional: Sam_JSON {
    func toJSONModel() -> Any? {
        if let x = self {
            if let value = x as? Sam_JSON {
                return value.toJSONModel()
            }
        }
        return nil
    }
}

// 扩展两个自定义类型,使其遵循JSON协议
extension User: Sam_JSON {}
extension Telephone: Sam_JSON {}

// 扩展Swift的基本数据类型,使其遵循JSON协议
extension String: Sam_JSON { }
extension Int: Sam_JSON { }
extension Bool: Sam_JSON { }
extension Dictionary: Sam_JSON { }
extension Array: Sam_JSON { }
