//
//  LGTest.m
//  LGSwiftTest
//
//  Created by hank on 2020/12/17.
//

#import "LGTest.h"
#import "LGSwiftTest-Swift.h"

@implementation LGTest

+ (void)testBlockCall:(ResultBlock)block{
        
    NSError *error = [NSError errorWithDomain:NSURLErrorDomain code:400 userInfo:nil];
    block(error);
}

@end

