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
#import "LGTeacher.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello World!");
        
        LGPerson *p = [[LGPerson alloc] init];
//        [LGPerson test2];
        [p test1];
        
        
//        LGTeacher *t = [LGTeacher alloc];
//        [t abc];
        
    }
    return 0;
}
