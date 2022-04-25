//
//  LGPerson.m
//  RuntimeApiTestDemo
//
//  Created by allin on 2022/4/21.
//

#import "LGPerson.h"

@implementation LGPerson

-(void)instanceMethod {
    NSLog(@"%s",__func__);
}
+(void)classMethod {
    NSLog(@"%s",__func__);
}

@end
