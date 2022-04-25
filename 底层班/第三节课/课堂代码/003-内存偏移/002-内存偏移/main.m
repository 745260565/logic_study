//
//  main.m
//  002-内存偏移
//
//  Created by cooci on 2021/6/16.
//  Copyright © 2021 cooci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        int a = 10;
        int b = 10;
        NSLog(@"%d -- %p",a,&a);
        NSLog(@"%d -- %p",b,&b);
        
        // 对象
        LGPerson *p1 = [LGPerson alloc];
        LGPerson *p2 = [LGPerson alloc];
        NSLog(@"%@ -- %p",p1,&p1);
        NSLog(@"%@ -- %p",p2,&p2);

        // 数组指针
        int c[4] = {5,6,7,9};
        int *d= c;
        NSLog(@"%p - %p - %p - %p - %p",&c,&c[0],&c[1],&c[2],&c[3]);
        NSLog(@"%p - %p - %p - %p",d,d+1,d+2,d+3);

        for (int i = 0; i<4; i++) {
            int value =  *(d+i);
            NSLog(@"%d",value);
        }
        NSLog(@"Hello World!");
    }
    return 0;
}
