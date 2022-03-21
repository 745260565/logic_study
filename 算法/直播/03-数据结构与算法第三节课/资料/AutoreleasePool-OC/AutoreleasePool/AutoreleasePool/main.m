//
//  main.m
//  AutoreleasePool
//
//  Created by ws on 2022/2/15.
//

#import <Foundation/Foundation.h>
#import "AutoreleasePool.h"



int main(int argc, const char * argv[]) {
    
    {
        void *ctx = objc_autoreleasePoolPush();
        
        NSObject *obj = [[NSObject new] retain];
        NSObject *obj1 = [[NSObject new] retain];
        NSObject *obj2 = [[NSObject new] retain];

        NSLog(@"%ld", (long)CFGetRetainCount(obj));
        NSLog(@"%ld", (long)CFGetRetainCount(obj1));
        NSLog(@"%ld", (long)CFGetRetainCount(obj2));

        objc_autorelease(obj);
        void *ctx1 = objc_autoreleasePoolPush();
        objc_autorelease(obj1);
        void *ctx2 = objc_autoreleasePoolPush();
        objc_autorelease(obj2);
        objc_autoreleasePoolPop(ctx2);
        NSLog(@"%ld", (long)CFGetRetainCount(obj2));
        objc_autoreleasePoolPop(ctx1);

        NSLog(@"%ld", (long)CFGetRetainCount(obj1));

        objc_autoreleasePoolPop(ctx);
        NSLog(@"%ld", (long)CFGetRetainCount(obj));
        
    }
    return 0;
}
