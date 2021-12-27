//
//  KHomeViewController.swift
//  SwiftDemo
//
//  Created by ChengHao on 2021/6/3.
//

import UIKit

class KHomeViewController: UIViewController {
    
    var tableView:UITableView!
    var titles = ["闭包","数组、字典、元组","反射、模型转数据","构造函数和析构函数","JSON解析","网络框架","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q"]
    let identifier = "resuedCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        
        setUpView()
        
//        self.navigationController?.pushViewController(MirrorViewController(), animated: false)
        
//        for i in 0..<6 {
//            getRandom(i: i)
//        }
        
    }
    
    func setUpView() {
        self.tableView = UITableView(frame: self.view.frame, style: .plain)
        print(self.view.frame)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        //创建头部标签
        let headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 30))
        headerLabel.text = "Header"
        self.tableView?.tableHeaderView = headerLabel
        self.view.addSubview(tableView)
    }
    
//    func getRandom(i:Int) {
//        let randomNumber:Int = Int(arc4random()%33)+1
//        print("第\(i+1)个:\(randomNumber)")
//    }
//
//    //获取一个1-max之间的随机数，闭区间
//    func getRandomIndex(max: UInt32) -> Int {
//        return Int(arc4random()%max)+1
//    }
//
//    func swapNumbers(stores: NSMutableArray,index: Int,last: Int) {
//        let temp = stores[index]
//        stores[index] = stores[last]
//        stores[last] = temp
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension KHomeViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = titles[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(ClosureViewController(), animated: false)
        case 1:
            self.navigationController?.pushViewController(CollectionViewController(), animated: false)
        case 2:
            self.navigationController?.pushViewController(MirrorViewController(), animated: false)
        case 3:
            self.navigationController?.pushViewController(InitDeinitViewController(), animated: false)
        default:
            return
        }
    }
    
    
}
