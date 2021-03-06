//
//  KListenViewController.swift
//  SwiftDemo
//
//  Created by ChengHao on 2021/6/3.
//

import UIKit
import LTScrollView

class KListenViewController: UIViewController {
    
    // MARK: - 懒加载
    // 头部视图
    private lazy var kListenHeaderView: KListenHeaderView = {
        let kListenHeaderView = KListenHeaderView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: SizeFloat(x: 120)))
        kListenHeaderView.delegate = self
         return kListenHeaderView
    }()
    
    // 各个控制器
    private lazy var vcArray: [UIViewController] = {
        let kListenSubscribeVC = KListenSubscribeViewController()
        let kListenOneclickVC = kListenOneclickViewController()
        let kListenRecommendVC = kListenRecommendViewController()
        return [kListenSubscribeVC,kListenOneclickVC,kListenRecommendVC]
    }()
    
    // 添加控制器上部标题
    private lazy var titleArray: [String] = {
       return ["订阅","一键听","推荐"]
    }()
    
    // 导航栏左边按钮
    private lazy var leftBarBtn: UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        button.setImage(UIImage(named: "msg"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(tapLeftBarBtn), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    // 导航栏右边按钮
    private lazy var rightBarBtn: UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        button.setImage(UIImage(named: "搜索"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(tapRightBarBtn), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    private lazy var ltLayout: LTLayout = {
        let layout = LTLayout()
        layout.isAverage = true // 平分整个宽度
        layout.sliderWidth = SizeFloat(x: 80)
        layout.titleViewBgColor = UIColor.white
        layout.titleColor = UIColor(r: 178, g: 178, b: 178)
        layout.titleSelectColor = UIColor(r: 16, g: 16, b: 16)
        layout.bottomLineColor = UIColor.red
        layout.sliderHeight = SizeFloat(x: 56)
        return layout
    }()
    
    private lazy var ltAdvanceManager: LTAdvancedManager = {
        let advanceManager = LTAdvancedManager(frame: CGRect(x: 0, y: StatusBarAndNavigationBarHeight, width: Int(kScreenWidth), height: Int(kScreenHeight)-StatusBarAndNavigationBarHeight), viewControllers: vcArray, titles: titleArray, currentViewController: self, layout: ltLayout, headerViewHandle: { [weak self] in
            guard let strongSelf = self else {
                return UIView()
            }
            let headerView = strongSelf.kListenHeaderView
            return headerView
        })
        // 设置代理 监听滚动
        advanceManager.delegate = self as? LTAdvancedScrollViewDelegate
        // 设置悬停位置
        //advancedManager.hoverY = -LBFMNavBarHeight
        // 点击切换滚动过程动画
        // advancedManager.isClickScrollAnimation = true
        // 代码设置滚动到第几个位置
        // advancedManager.scrollToIndex(index: viewControllers.count - 1)
        return advanceManager
    }()

    // MARK: - VC周期
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        // 导航栏左右item
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftBarBtn)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightBarBtn)
        
        view.addSubview(ltAdvanceManager)
        selectedAdvanced()
    }
    
    // MARK: - 按钮方法
    @objc func tapLeftBarBtn() {
        
    }
    
    @objc func tapRightBarBtn() {
        
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

// MARK: - LTAdvancedScrollViewDelegate 代理
// extension有分割的作用 本体可以任意调用extension里的方法
extension KListenViewController : LTAdvancedScrollViewDelegate {
    
    private func selectedAdvanced() {
        //选中事件
        ltAdvanceManager.advancedDidSelectIndexHandle = {
            print("选中了 -> \($0)")
        }
    }
    
    func glt_scrollViewOffsetY(_ offsetY: CGFloat) {
        
    }
}

// MARK: - KListenHeaderViewDelegate 代理
extension KListenViewController: KListenHeaderViewDelegate {
    
    func doSelectedAtIndex(index: Int) {
        print("点击了头上的\(index)")
    }

}
