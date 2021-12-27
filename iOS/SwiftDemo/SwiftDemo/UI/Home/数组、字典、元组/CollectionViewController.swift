//
//  CollectionViewController.swift
//  SwiftDemo
//
//  Created by ChengHao on 2021/6/28.
//

import UIKit

class CollectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "数组、字典、元组"
        // Do any additional setup after loading the view.
        //数组
        var array1: [String] = [String]()
        var array11: [Any] = ["cj" , 18]
        let array12 = [String]()
        let array13 = [Any]()
        var array2 = [String](repeating: "s", count: 1)
        let array3:[Int] = [1,2,3]
        var array4 = [String](arrayLiteral: "1","2")
        //取值
        print(array4[0])
        print([array4 .first])
        print(array4.last)
        
        //字典
        var dic = [Int: String]()//key为int value为value
        var dict:[String:Int] = ["a":1, "b":2]
        var dictt = ["a": 1,"b":2]
        var dicttt = Dictionary<String,String>()
        dictt["c"] = 3
        dictt.removeValue(forKey: "a")
        
        //空元组
        let tuple = ()
        let tuplesampleone = (name:"ffff",sex:false)
        let tuplesamplethree:(String,String,Bool) = (name:"ddd",sex:"man",old:true)
        let tuplesampletwo = tuplesampleone
        //使用下划线 _ 忽略某个元素的值，取出其他元素的值
        var (N, _ ) = tuplesampleone
        print(tuplesampletwo.name)
        print(tuplesampletwo.sex)
        print(tuplesampleone.sex)
        print(tuplesampletwo.1)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
