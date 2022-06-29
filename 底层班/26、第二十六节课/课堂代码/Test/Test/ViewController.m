//
//  ViewController.m
//  Test
//
//  Created by allin on 2022/6/13.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (int i = 0; i < 100000000; i ++) {
        @autoreleasepool {
            NSString *obj = [NSString stringWithFormat:@"%@",@"1234567890"];
        }
    }
    
}


@end
