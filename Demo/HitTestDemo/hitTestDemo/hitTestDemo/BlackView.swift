//
//  BlackView.swift
//  hitTestDemo
//
//  Created by chenghao on 2022/9/2.
//

import UIKit
import AVFoundation

class BlackView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        self.setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        let btn = UIButton.init(frame: CGRect.init(x: 20, y: 20, width: 100, height: 50))
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        self.addSubview(btn)
        
        let btn2 = UIButton.init(frame: CGRect.init(x: 20, y: 80, width: 100, height: 50))
        btn2.backgroundColor = .green
        btn2.addTarget(self, action: #selector(btnAction2), for: .touchUpInside)
        self.addSubview(btn2)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        print("Black touch:\(touch.location(in: self))")
    }
    
    @objc func btnAction() {
        print("btnAction1")
    }
    
    @objc func btnAction2() {
        print("btnAction2")
        
//        guard let audioFile = Bundle.main.path(forResource: "low_power", ofType: "caf") else { return }
//        let fileUrl = URL.init(fileURLWithPath: audioFile)
//        var soundId: SystemSoundID = 1
//        AudioServicesCreateSystemSoundID(fileUrl as CFURL, &soundId)
//        AudioServicesPlayAlertSound(soundId) // 播放音效并震动
        let soundId: SystemSoundID = 1006
        AudioServicesPlaySystemSound(soundId)
        
    }
    
    /// - (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
    ///  往下传递（superview）：return nil
    ///  往上传弟（subview）：returen [super hitTest:point withEvent:event];
    /// 自己消化，停止传递：return self
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        for subView in self.subviews {
            let converPoint = self.convert(point, to: subView) //获取转换坐标
            if subView.bounds.contains(converPoint) { //button范围内
//                return self
                return super.hitTest(point, with: event) //button范发围内向上传递（传给子视图）
            }
        }
//        return self
        return nil //button范围外向下传递（传给父视图）
    }
    
//    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//        return self.bounds.inset(by: .init(top: -30, left: -30, bottom: -30, right: -30)).contains(point)
//    }

}
