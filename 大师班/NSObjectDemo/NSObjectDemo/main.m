//
//  main.m
//  NSObjectDemo
//
//  Created by ChengHao on 2022/3/30.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "LGPerson.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
        LGPerson *p = [[LGPerson alloc] init];
        p.name = @"程浩";
        p.hobby = @"sdk";
        p.hight = 1.80;
        p.age = 10;
        p.number = 123;
        
//        NSLog(@"%lu",malloc_size)
        
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
