//
//  ViewController.m
//  LGMainThreadBlock
//
//  Created by cooci on 2019/12/30.
//  Copyright © 2020 cooci. All rights reserved.
//

#import "ViewController.h"
#import "LGBlockMonitor.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[LGBlockMonitor sharedInstance] start];
}


- (IBAction)buttonAction:(id)sender {
    [NSThread sleepForTimeInterval:5];
    
    UIView *v = [[UIView alloc] init];
    v.frame = CGRectMake(0, 100, 100, 100);
    v.backgroundColor = [UIColor redColor];
    [self.view addSubview:v];
    
}


@end
