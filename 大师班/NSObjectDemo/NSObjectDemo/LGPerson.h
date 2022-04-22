//
//  LGPerson.h
//  NSObjectDemo
//
//  Created by ChengHao on 2022/3/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGPerson : NSObject
@property(nonatomic, copy)NSString *name;
@property(nonatomic, copy)NSString *hobby;
@property(nonatomic, assign)float hight;
@property(nonatomic, assign)short number;
@property(nonatomic, assign)int age;
@end

NS_ASSUME_NONNULL_END
