//
//  LGPerson.m
//  SXObjcDebug
//
//  Created by allin on 2022/4/18.
//

#import "LGPerson.h"

@implementation LGPerson

- (void)instanceMethod {
    NSLog(@"%s",__func__);
}
+ (void)classMethod {
    NSLog(@"%s",__func__);
}
@end
