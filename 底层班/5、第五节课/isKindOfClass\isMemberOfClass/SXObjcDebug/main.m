//
//  main.m
//  SXObjcDebug
//
//  Created by Allin on 2022/4/13.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>
#import "LGPerson.h"

void lgKindofDemo(void){
    BOOL re1 = [(id)[NSObject class] isKindOfClass:[NSObject class]];
    BOOL re2 = [(id)[NSObject class] isMemberOfClass:[NSObject class]];
    BOOL re3 = [(id)[LGPerson class] isKindOfClass:[LGPerson class]];
    BOOL re4 = [(id)[LGPerson class] isMemberOfClass:[LGPerson class]];
    NSLog(@" \n re1 = %d\n re2 = %d\n re3 = %d\n re4 = %d",re1,re2,re3,re4);

    BOOL re5 = [(id)[NSObject alloc] isKindOfClass:[NSObject class]];
    BOOL re6 = [(id)[NSObject alloc] isMemberOfClass:[NSObject class]];
    BOOL re7 = [(id)[LGPerson alloc] isKindOfClass:[LGPerson class]];
    BOOL re8 = [(id)[LGPerson alloc] isMemberOfClass:[LGPerson class]];
    NSLog(@" \n re5 = %d\n re6 = %d\n re7 = %d\n re8 = %d",re5,re6,re7,re8);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello World!");
        lgKindofDemo();
    }
    return 0;
}
