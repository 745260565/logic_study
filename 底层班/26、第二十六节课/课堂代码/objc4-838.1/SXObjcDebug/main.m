//
//  main.m
//  SXObjcDebug
//
//  Created by Allin on 2022/4/13.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

extern void _objc_autoreleasePoolPrint(void);

@interface LGPerson : NSObject

@property (nonatomic ,copy) NSString *name;

@end

@implementation LGPerson

@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello world!");
        
        LGPerson *p = [LGPerson alloc];
                
    }
    
    return 0;
}

