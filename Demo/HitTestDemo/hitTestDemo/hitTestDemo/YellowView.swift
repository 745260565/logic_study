//
//  YellowView.swift
//  hitTestDemo
//
//  Created by chenghao on 2022/9/2.
//

import UIKit

class YellowView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .yellow
        self.setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        let blackView = BlackView.init(frame: CGRect.init(x: 50, y: 50, width: 200, height: 200))
        self.addSubview(blackView)
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first else { return }
//        print("YellowView touch:\(touch.location(in: self))")
//
//    }
    
}
