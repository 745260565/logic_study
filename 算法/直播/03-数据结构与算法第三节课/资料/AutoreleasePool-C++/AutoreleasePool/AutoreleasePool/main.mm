//
//  main.cpp
//  AutoreleasePool
//
//  Created by ws on 2021/12/30.
//

#include <iostream>
#import <Foundation/Foundation.h>
#include <AutoreleasePool.h>

int main(int argc, const char * argv[]) {
    // 线程 -》page -〉hotpage
    {
        void *ctx = objc_autoreleasePoolPush();
        
        NSObject *obj = [NSObject new];
        NSObject *obj1 = [NSObject new];

        objc_autorelease(obj);
        void *ctx1 = objc_autoreleasePoolPush();
        objc_autorelease(obj1);
        objc_autoreleasePoolPop(ctx1);

        NSLog(@"%ld", (long)CFGetRetainCount(obj1));

        objc_autoreleasePoolPop(ctx);
        NSLog(@"%ld", (long)CFGetRetainCount(obj));

    }
//    NSLog(@"%ld", (long)CFGetRetainCount(obj));

    return 0;
}
