//
//  ViewController.m
//  000-runloop源码查看
//
//  Created by cooci on 2021/2/27.
//  Copyright © 2021 cooci. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // runloop mode - item
    // CFMutableSetRef _commonModes; 多个
    // CFMutableSetRef _commonModeItems; 多个
    // defaultMode - items
    // timer 依赖 mode -> run
    // items (source0 source1 timers observers) -> mode -> runloop 执行
    // 底层原理结构
    [NSRunLoop currentRunLoop] addTimer:<#(nonnull NSTimer *)#> forMode:<#(nonnull NSRunLoopMode)#>
}


@end
