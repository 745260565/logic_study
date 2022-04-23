//
//  ViewController.m
//  RuntimeApiTestDemo
//
//  Created by ChengHao on 2022/4/22.
//

#import "ViewController.h"
#import <objc/message>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)lg_class_copyIvarList:(Class)pClass {
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList(pClass, &outCount);
    for (int i = 0; i< outCount; i++) {
        Ivar ivar = ivars[i];
        const char *cName = ivar_getName(ivar);
        const char *cType = ivar_getTypeEncoding(ivar);
        NSLog(@"name=%s type=%s",cName,cType);
    }
    free(ivars);
}


@end
