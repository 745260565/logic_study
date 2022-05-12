//
//  FMUserInfo.h
//  alloc_test
//
//  Created by chenghao on 2022/5/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FMUserInfo : NSObject
//isa  8
@property (nonatomic ,copy) NSString *name;  //8
@property (nonatomic ,copy) NSString *address;  //8
@property (nonatomic ,assign) int age;   //4
@property (nonatomic ,assign) double hight;  //8
@property (nonatomic ,assign) short number;  //2
@property (nonatomic ,assign) char sex;  //1
-(void)getUserCurrentInfo;
-(void)getUserCurrentLocation;
@end

NS_ASSUME_NONNULL_END
