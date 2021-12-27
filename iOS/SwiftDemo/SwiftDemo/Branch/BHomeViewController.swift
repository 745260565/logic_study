//
//  BHomeViewController.swift
//  SwiftDemo
//
//  Created by ChengHao on 2021/9/3.
//

import UIKit

class BHomeViewController: UIViewController {

    var tableView = UITableView()
    var dataList: NSMutableArray = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "基本控件"
        dataList = NSMutableArray.init(array: ["基本的cell","带索引的cell","带搜索的cell"])
        initUI()
    }
    
    func initUI() {
        tableView = UITableView.init(frame: UIScreen.main.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        //去掉多余的分隔线
        tableView.tableFooterView = UIView()
        self.view.addSubview(tableView)
    }
    
}

extension BHomeViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = dataList[indexPath.row] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = TableView1ViewController()
            vc.title = dataList[indexPath.row] as? String
            self.navigationController?.pushViewController(vc, animated: true)
            break
        default:
            break
        }
    }
}
