//
//  ViewController.m
//  demo
//
//  Created by chenghao on 2021/8/12.
//  Copyright © 2021 chenghao. All rights reserved.
//

#import "ViewController.h"
#import "LGPerson.h"

@interface ViewController ()

@end

@implementation ViewController

/**
 1、方法的本质，sel是什么？IMP是什么？两者是什么关系
    消息-objc_msgSend-快速查找（cache）-二分查找(methodlist,本身methodlist,继承链的)-动态解析-快速的转发流程-慢速转发（消息派发）
 应用：aspect(埋点),优化，CTMedio
 */

/**
 2、内存平移
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Class cls = [LGPerson class];
    void *kc = &cls;//ISA
    [(__bridge id)kc saySomething];
    
    LGPerson *person = [LGPerson alloc];
    [person saySomething];
}


@end
