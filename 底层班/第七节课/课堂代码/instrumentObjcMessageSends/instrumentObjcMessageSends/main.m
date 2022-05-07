//
//  main.m
//  instrumentObjcMessageSends
//
//  Created by allin on 2022/5/4.
//

#import <Foundation/Foundation.h>
#import "LGPerson.h"

extern void instrumentObjcMessageSends(BOOL flag);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        LGPerson *person = [LGPerson alloc];
        instrumentObjcMessageSends(YES);
        [person test];
        instrumentObjcMessageSends(NO);
    }
    return 0;
}
