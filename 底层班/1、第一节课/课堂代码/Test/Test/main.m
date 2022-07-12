//
//  main.m
//  Test
//
//  Created by allin on 2022/4/15.
//

#import <Foundation/Foundation.h>

int func (int x) {
    return (x + 7) >> 3 << 3;
}

//以空间换时间 对象isa  -- 8字节 -- 16字节  --2    --32
//对象

//对象本质是什么?
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        
        __block int i = 10;
        __block int j = 20;
        NSLog(@"111%p",&i);
        NSLog(@"111%p",&j);
        void (^myBlock)(void) = ^{
            i = 30;
          NSLog(@"222%p",&i);
          NSLog(@"222%p",&j);
        };
        NSLog(@"333%p",&i);
        NSLog(@"333%p",&j);
        myBlock();
        NSLog(@"444%p",&i);
//        i = ?
        NSLog(@"444%p",&j);
        
//        dispatch_queue_t serialQueue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
//
//          NSLog(@"1");
//
//          dispatch_async(serialQueue, ^{
//              sleep(1);
//             NSLog(@"2");
//          });
//
//          NSLog(@"3");
//
//          dispatch_sync(serialQueue, ^{
//
//            NSLog(@"4");
//          });
//
//          NSLog(@"5");
        
    }
    return 0;
}
