//
//  LGPerson.h
//  RuntimeApiTestDemo
//
//  Created by allin on 2022/4/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGPerson : NSObject {
    NSString *_hobby;
}

@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,assign) int age;

-(void)instanceMethod;
+(void)classMethod; //rw -- ro // NSObject -- --

@end

NS_ASSUME_NONNULL_END
