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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello World!");
            
        LGPerson *p = [LGPerson alloc];
        
    }
    return 0;
}
