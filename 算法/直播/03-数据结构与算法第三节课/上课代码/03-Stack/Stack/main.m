//
//  main.m
//  Stack
//
//  Created by ws on 2022/3/2.
//

#import <Foundation/Foundation.h>
#import "Stack.h"
#import <objc/runtime.h>


int main(int argc, const char * argv[]) {
    NSObject *obj = [[NSObject new] retain];
    NSObject *obj1 = [[NSObject new] retain];
    NSObject *obj2 = [[NSObject new] retain];
    
    NSLog(@"%ld", (long)CFGetRetainCount(obj2));
    NSLog(@"%ld", (long)CFGetRetainCount(obj1));
    NSLog(@"%ld", (long)CFGetRetainCount(obj));
    Stack *stack = [Stack new];
    void * ctx = [stack push:obj];
    void * ctx1 = [stack push:obj1];
    void * ctx2 = [stack push:obj2];
    NSLog(@"%@", stack);
    [stack pop:ctx];
    NSLog(@"%@", stack);
    [stack pop:ctx1];

    NSLog(@"%ld", (long)CFGetRetainCount(obj2));
    NSLog(@"%ld", (long)CFGetRetainCount(obj1));
    NSLog(@"%ld", (long)CFGetRetainCount(obj));

    return 0;
}
