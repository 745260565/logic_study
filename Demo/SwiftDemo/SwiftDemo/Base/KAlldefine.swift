//
//  KAlldefine.swift
//  SwiftDemo
//
//  Created by ChengHao on 2021/6/2.
//

import UIKit
import Foundation

var StatusHeight: CGFloat?
var NavHeight: CGFloat?
var TabBarHeight: CGFloat?

// Swift中是不能使用宏定义语法的，但是因为命名空间的缘故，我们可以给我们的项目添加一个空的xxx.swift文件
// 在这xxx.swift中，我们将原本OC中不需要接受参数的宏，定义成let常量
// 在这xxx.swift中，将需要接受参数的宏定义成函数即可

//#define Screen_Width [UIScreen mainScreen].bounds.size.width
//#define Screen_Height [UIScreen mainScreen].bounds.size.height
let kScreenBounds = UIScreen.main.bounds
let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height

//相对 4.7屏尺寸
//#define LengthInIP6(lengthInIP6) ((CGFloat)lengthInIP6)/375*kScreenWidth
func LengthInIP6(lengthInIP6: CGFloat) -> CGFloat {
    return lengthInIP6/375*kScreenWidth
}

//包含热点栏（如有）高度，标准高度为20pt，当有个人热点连接时，高度为40pt。iphonex系统标准高度是44,当有个人热点连接时，高度为64pt
//#define APP_STATUSBAR_HEIGHT [UIApplication sharedApplication].statusBarFrame.size.height
func APP_STATUSBAR_HEIGHT() -> CGFloat {
    return UIApplication.shared.statusBarFrame.size.height
//    if #available(iOS 13.0, *) {
//        let statusBarManager = UIApplication.shared.windows.first?.windowScene?.statusBarManager;
//        return statusBarManager!.statusBarFrame.size.height
//    } else {
//        return UIApplication.shared.statusBarFrame.size.height
//    }
}

//iPhoneX / iPhoneXS / iPhone11 Pro / iPhone 12 mini
//#define isIphoneX_XS (kScreenWidth == 375.f && kScreenHeight == 812.f ? YES : NO)
let isIphoneX_XS = (kScreenWidth == 375 && kScreenHeight == 812) ? true : false
//iPhoneXR / iPhoneXSMax / iPhone11 / iPhone11 Pro Max
//#define isIphoneXR_XSMax (kScreenWidth == 414.f && kScreenHeight == 896.f ? YES : NO)
let isIphoneXR_XSMax = (kScreenWidth == 414 && kScreenHeight == 896) ? true : false
//iPhone12 / iPhone Pro
//#define isIphone12 (kScreenWidth == 390.f && kScreenHeight == 844.f ? YES : NO)
let isIphone12 = (kScreenWidth == 390 && kScreenHeight == 844) ? true : false
// iPhone12 Pro Max
//#define isIphone12ProMax (kScreenWidth == 428.f && kScreenHeight == 926.f ? YES : NO)
let isIphone12ProMax = (kScreenWidth == 428 && kScreenHeight == 926) ? true : false
//是否是刘海屏
//#define   isFullScreen    (isIphoneX_XS || isIphoneXR_XSMax)
let isFullScreen = isIphoneX_XS||isIphoneXR_XSMax||isIphone12||isIphone12ProMax

//Status bar height.标准情况下StatusBarHeight,APP_STATUSBAR_HEIGHT等同于APP_STATUSBAR_HEIGHT,连接热点会加20,适配热点连接时直接用这个，系统会扣除热点增加的高度
//#define  CHStatusBarHeight  (isFullScreen ? 44.f : 20.f)
let StatusBarHeight = isFullScreen ? 44 : 20
// Tabbar safe bottom margin.
//#define  TabbarSafeBottomMargin  (isFullScreen ? 34.f : 0.f)
let TabbarSafeBottomMargin = isFullScreen ? 34 : 0
// Navigation bar height.
//#define NavigationBarHeight 44.f
let NavigationBarHeight = 44
// Tabbar height.
//#define TabbarHeight (isFullScreen ? (49.f+34.f) : 49.f)
let TabbarHeight = isFullScreen ? 83 : 49
// Status bar & navigation bar height.
//#define  StatusBarAndNavigationBarHeight  (isFullScreen ? 88.f : 64.f)
let StatusBarAndNavigationBarHeight = isFullScreen ? 88 : 64

// OC写法
//#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
// Swift写法
func RGBCOLOR(r: Int, _ g: Int, _ b: Int) -> UIColor {
    return UIColor(red: (CGFloat(r))/255.0, green: (CGFloat(g))/255.0, blue: (CGFloat(b))/255.0, alpha: 1.0)
}

func HEXCOLOR(rgb: Int) -> UIColor {
    return RGBCOLOR(r: (rgb >> 16) & 0xFF, (rgb >> 8) & 0xFF, rgb & 0xFF)
}

let LBFMButtonColor = UIColor(red: 242/255.0, green: 77/255.0, blue: 51/255.0, alpha: 1)
let LBFMDownColor = UIColor.init(red: 240/255.0, green: 241/255.0, blue: 244/255.0, alpha: 1)

// 适配等比放大控件
//#define SizeFloat(x)                   ((x) * Screen_Width * 1.0 / 375.0)
func SizeFloat(x: CGFloat) -> CGFloat {
    return ((x) * kScreenWidth * 1.0 / 375.0)
}
