//
//  UIView+Frame.h
//  OCTest
//
//  Created by chenghao on 2022/8/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Frame)
@property CGFloat origin_x;
@property CGFloat origin_y;
@property CGFloat width;
@property CGFloat height;

- (void)moveTo:(CGPoint)point;

@end

NS_ASSUME_NONNULL_END
