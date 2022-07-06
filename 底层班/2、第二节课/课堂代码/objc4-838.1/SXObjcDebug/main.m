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

int test (LGPerson *p) {
   
    NSLog(@"%lu",sizeof(p));
    NSLog(@"%zu",class_getInstanceSize(p.class));
    NSLog(@"%zu",malloc_size((__bridge const void *)(p)));
    
    return 0;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello World!");
        
        //
        
        LGPerson *p = [LGPerson alloc];
        LGPerson *p1 = p;
        test(p);
        
    }
    return 0;
}
