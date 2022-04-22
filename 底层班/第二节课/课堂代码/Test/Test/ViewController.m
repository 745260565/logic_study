//
//  ViewController.m
//  Test
//
//  Created by allin on 2022/4/16.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import <malloc/malloc.h>
#import "OSTestObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    OSTestObject1 *objc1 = [[OSTestObject1 alloc] init];
    NSLog(@"objc1实际占用的内存空间为%zd",class_getInstanceSize([OSTestObject1 class]));
    NSLog(@"系统为objc1开辟的内存空间为%zd",malloc_size((__bridge const void *)objc1));
}

@end
