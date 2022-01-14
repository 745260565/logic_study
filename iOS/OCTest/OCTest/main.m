//
//  main.m
//  OCTest
//
//  Created by ChengHao on 2022/1/13.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int sum(int a, int b) {
    return a + b;
}

int main(int argc, char * argv[]) {
    int a = sum(1,2);
    NSLog(@"%d",a);
    return 0;
}

//int main(int argc, char * argv[]) {
//    NSString * appDelegateClassName;
//    @autoreleasepool {
//        // Setup code that might create autoreleased objects goes here.
//        appDelegateClassName = NSStringFromClass([AppDelegate class]);
//    }
//    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
//}
