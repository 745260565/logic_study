//
//  main.m
//  Blocktest
//
//  Created by ws on 2020/4/2.
//

#import <Foundation/Foundation.h>


int main() {
     NSObject *self = [NSObject new];
    __strong NSObject *weakSelf = self;
//
//    // 1
//    NSLog(@"%ld",CFGetRetainCount((__bridge CFTypeRef)(self)));
//    // 对上
//    void(^weakBlock1)(void) = ^{
//        weakSelf = self;
//        // 3
//        NSLog(@"---%ld",CFGetRetainCount((__bridge CFTypeRef)(self)));
//    };
//    // mach-o？
//    weakBlock1();
//    int a = 1;
//    NSObject *strongSelf = self;

    __weak void(^block)(void) = ^{
//        weakSelf;
//        __strong NSObject * strongSelf = weakSelf;
//        void(^block1)(void) = ^{
//            strongSelf;
//        };
    };
}
