//
//  SceneDelegate.swift
//  SwiftDemo
//
//  Created by ChengHao on 2021/6/2.
//

import UIKit
import ESTabBarController_swift
import SwiftMessages

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // 在iOS 13新增了分配功能 所以在新建的项目中会包含一个名为SceneDelegate的文件
        // 在AppDelegate文件中找不到属性window window属性被移到了当前SceneDelegate文件中
        // 在App启动时候想使用自己自定义的根控制器 则需要在此处进行设置 否则会走storyboard
        // info.plist中找到Application Scene Manifest 将Storyboard Name : Main删除 不要只删掉Main要一起删掉
        // 在这里执行和以前didFinishLaunchingWithOptions一样的操作
//        let myVC = ViewController()
//        let NavigationController = UINavigationController(rootViewController: myVC)
        
        let esTabBarController = setupTabbar(delegate: self as? UITabBarControllerDelegate)
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = UIColor.systemBackground
        window?.rootViewController = esTabBarController
//        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
        
//        let tabBar = UITabBarController()
//        let bhome = BHomeViewController()
//        let nav1 = initTabBar(vc: bhome,naviTitle: "首页-顶", tabBarTitle: "首页", image: "home", selectedImage: "home_1")
//        nav1.title = "练习首页"
//        tabBar.addChild(nav1)
//        let bmine = BMineViewController()
//        let nav2 = initTabBar(vc: bmine, naviTitle: "用户-顶", tabBarTitle: "首页", image: "me", selectedImage: "me_1")
//        nav1.title = "用户"
//        tabBar.addChild(nav2)
//        window = UIWindow(windowScene: windowScene)
//        window?.backgroundColor = UIColor.white
//        window?.rootViewController = tabBar
//        window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    func initTabBar(vc:UIViewController,naviTitle:String,tabBarTitle:String,image:String,selectedImage:String) -> UINavigationController {
        vc.title = naviTitle//nava标题
        vc.tabBarItem.image = UIImage(named: image)
        vc.tabBarItem.selectedImage = UIImage(named: selectedImage)
        vc.tabBarItem.title = tabBarTitle
//        vc1.tabBarItem.badgeColor = UIColor.blue
//        vc1.tabBarItem.badgeValue = "a"
        let nav1 = UINavigationController(rootViewController: vc);
        return nav1
    }
    
    func setupTabbar(delegate: UITabBarControllerDelegate?) -> ESTabBarController {
        
        let esTabBarController = ESTabBarController()
        esTabBarController.delegate = delegate
        esTabBarController.title = "Irregularity"
        esTabBarController.tabBar.shadowImage = UIImage(named: "transparent")
        esTabBarController.shouldHijackHandler = {
            tabbarController, viewController, index in
            if index == 2 {
                return true
            }
            return false
        }
        esTabBarController.didHijackHandler = {
            [weak esTabBarController] tabbarController, viewController, index in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                let warning = MessageView.viewFromNib(layout: .cardView)
                warning.configureTheme(.warning)
                warning.configureDropShadow()
                
                warning.configureContent(title: "Warning", body: "暂时没有此功能", iconText: "🙄")
                warning.button?.isHidden = true
                var warningConfig = SwiftMessages.defaultConfig
                warningConfig.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
                SwiftMessages.show(config: warningConfig, view: warning)
            }
        }
        
        let kHomePageVC = KHomeViewController()
        let kListenVC = KListenViewController()
        let kPlayVC = KPlayViewController()
//        let kFindVC = KFindViewController()
        let kSwiftVC = KSwiftViewController()
        let kMineVC = KMineViewController()
        
        kHomePageVC.tabBarItem = ESTabBarItem.init(KIrregularityTabBarItemContentView(), title: "首页", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        kListenVC.tabBarItem = ESTabBarItem.init(KIrregularityTabBarItemContentView(),title: "我听",image: UIImage(named: "find"),selectedImage: UIImage(named: "find_1"))
        kPlayVC.tabBarItem = ESTabBarItem.init(KIrregularityCenterTabBarItemContentView(), title: nil, image: UIImage(named: "tab_play"), selectedImage: UIImage(named: "tab_play"))
//        kFindVC.tabBarItem = ESTabBarItem.init(KIrregularityTabBarItemContentView(),title: "发现",image: UIImage(named: "favor"),selectedImage: UIImage(named: "favor_1"))
        kSwiftVC.tabBarItem = ESTabBarItem.init(KIrregularityTabBarItemContentView(),title: "swift",image: UIImage(named: "favor"),selectedImage: UIImage(named: "favor_1"))
        kMineVC.tabBarItem = ESTabBarItem.init(KIrregularityTabBarItemContentView(),title: "我的",image: UIImage(named: "me"),selectedImage: UIImage(named: "me_1"))
        
        let kHomePageNav = KBaseNavigationController.init(rootViewController: kHomePageVC)
        let kListenNav = KBaseNavigationController.init(rootViewController: kListenVC)
        let kPlayNav = KBaseNavigationController.init(rootViewController: kPlayVC)
        let kSwiftNav = KBaseNavigationController.init(rootViewController: kSwiftVC)
        let kMineNav = KBaseNavigationController.init(rootViewController: kMineVC)
        kHomePageVC.title = "首页"
        kListenVC.title = "我听"
        kSwiftVC.title = "swift"
        kMineVC.title = "我的"
        esTabBarController.viewControllers = [kHomePageNav,kListenNav,kPlayNav,kSwiftNav,kMineNav]
        esTabBarController.selectedIndex = 3
        return esTabBarController
    }


}

