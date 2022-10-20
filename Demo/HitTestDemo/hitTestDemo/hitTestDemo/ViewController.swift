//
//  ViewController.swift
//  hitTestDemo
//
//  Created by chenghao on 2022/9/2.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let yellowView = YellowView.init(frame: CGRect.init(x: 10, y: 150, width: 400, height: 400))
        self.view.addSubview(yellowView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        print("ViewController touch:\(touch.location(in: self.view))")
    }
    
    
    

}

