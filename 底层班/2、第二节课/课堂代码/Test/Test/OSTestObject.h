//
//  OSTestObject.h
//  ObjectStudy
//
//  Created by 王飞 on 2022/4/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OSTestObject : NSObject
{
    @public
//    int count;
    NSObject *objc1;
    NSObject *objc2;
    int count;
  
    //什么原因?
    
    //16 -- 1024 1K
}
@end

@interface OSTestObject1 : OSTestObject
{
    @public
    int _count2;
}
@end


NS_ASSUME_NONNULL_END
