//
//  LGTest.h
//  LGSwiftTest
//
//  Created by hank on 2020/12/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ResultBlock)(NSError *error);

@interface LGTest : NSObject

+ (void)testBlockCall:(ResultBlock)block;

@end

NS_ASSUME_NONNULL_END
