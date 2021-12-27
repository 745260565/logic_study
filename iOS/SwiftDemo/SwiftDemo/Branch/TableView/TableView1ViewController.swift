//
//  TableView1ViewController.swift
//  SwiftDemo
//
//  Created by ChengHao on 2021/9/3.
//

import UIKit

class TableView1ViewController: UIViewController {
    
    var tableView = UITableView()
    var dataList: NSMutableArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .edit, target: self, action: #selector(editAction))
        dataList = NSMutableArray.init(array: ["🐰", "秃子", "鹰酱", "毛熊", "棒子", "脚盆鸡", "高卢鸡", "狗大户", "🐫", "沙某", "河马"])
        initUI()
        // Do any additional setup after loading the view.
    }
    
    func initUI() {
        tableView = UITableView.init(frame: UIScreen.main.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        tableView.tableFooterView = UIView()
        self.view.addSubview(tableView)
    }
    
    @objc func editAction() {
        tableView.setEditing(true, animated: true)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
    }
    
    @objc func doneAction() {
        tableView.setEditing(false, animated: true)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .edit, target: self, action: #selector(editAction))
    }
}

extension TableView1ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = dataList[indexPath.row] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(dataList[indexPath.row])
    }
    
    //MARK: - 使cell的分割线与屏幕两端对齐
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if cell.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            cell.separatorInset = .zero
        }
        if cell.responds(to: #selector(setter: UITableViewCell.layoutMargins)) {
            cell.layoutMargins = .zero
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle(rawValue: UITableViewCell.EditingStyle.RawValue(UInt8(UITableViewCell.EditingStyle.insert.rawValue) | UInt8(UITableViewCell.EditingStyle.delete.rawValue)))!
    }

}
