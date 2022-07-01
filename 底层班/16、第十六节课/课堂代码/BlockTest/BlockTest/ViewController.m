//
//  ViewController.m
//  BlockTest
//
//  Created by allin on 2022/5/29.
//

#import "ViewController.h"
#import "NSObject+Block.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-unsafe-retained-assign"


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self blockDemo2];
}

- (void)blockDemo1{
    int a = 1;
    void(^ __weak weakBlock)(void) = ^{
        NSLog(@"-----%d", a);
    };
    struct _LGBlock *blc = (__bridge struct _LGBlock *)weakBlock;
    void(^strongBlock)(void) = weakBlock;
    blc->invoke = nil;
    strongBlock();
}

- (void)blockDemo2{
    
    int a = 1;
    void(^__weak block1)(void) = nil;
    {
        void(^__weak block2)(void) = ^{
            NSLog(@"%d",a);
        };
        block1 = block2;
    }
    block1();
}

@end

#pragma clang diagnostic pop
