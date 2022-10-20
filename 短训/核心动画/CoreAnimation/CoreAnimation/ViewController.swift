//
//  ViewController.swift
//  CoreAnimation
//
//  Created by chenghao on 2022/9/9.
//

import UIKit

class ViewController: UIViewController {
    
    var layer: CALayer?
    @IBOutlet weak var redView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let layer = CALayer.init()
        layer.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        layer.backgroundColor = UIColor.green.cgColor
        self.layer = layer
        self.view.layer.addSublayer(self.layer!)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let animation = CABasicAnimation.init()
        animation.keyPath = "position.y" //修改y的位置
        animation.toValue = 600
        animation.duration = 1
        
        /*
         CAMediaTimingFillMode
         forwards: 动画结束后,layer会一直保持动画最后的状态
         backwards: 在动画开始前，只要将动画加入一个layer,便立即进入动画的初始状态，并等待动画的开始
         both: forwards&backwards
         removed:默认，动画结束，对原始layer没有影
         */
        
        //解决动画恢复到初始位置
        animation.isRemovedOnCompletion = false
        animation.fillMode = .backwards
        
        redView.layer.add(animation, forKey: nil)
        
        // 隐式动画默认时间是0.25秒，由runloop控制
        // 控制隐式动画
        let transition = CATransition()
        transition.duration = 2.0
        transition.delegate = self
        self.layer?.add(transition, forKey: nil)
        
        self.layer?.backgroundColor = UIColor.orange.cgColor
        
    }


}

extension ViewController: CAAnimationDelegate {
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        var transform = self.layer?.affineTransform()
        transform = CGAffineTransform.
    }
}

