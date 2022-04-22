//
//  main.m
//  alloc_test
//
//  Created by chenghao on 2022/4/15.
//

#import <Foundation/Foundation.h>

int sum(int a,int b) {
    return a + b;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        int a = 3;
        int b = 4;
        int c = sum(a,b);
        NSLog(@"%d",c);
    }
    return 0;
}
