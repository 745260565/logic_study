//
//  LGPerson.m
//  SXObjcDebug
//
//  Created by allin on 2022/4/18.
//

#import "LGPerson.h"

@implementation LGPerson

- (void)method1 {
    NSLog(@"%s",__func__);
}
- (void)method2 {
    NSLog(@"%s",__func__);
}
- (void)method3 {
    NSLog(@"%s",__func__);
}
- (void)method4 {
    NSLog(@"%s",__func__);
}

+ (void)method5 {
    NSLog(@"%s",__func__);
}
+ (void)method6 {
    NSLog(@"%s",__func__);
}

@end
