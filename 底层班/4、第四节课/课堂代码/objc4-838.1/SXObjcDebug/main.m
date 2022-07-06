//
//  main.m
//  SXObjcDebug
//
//  Created by Allin on 2022/4/13.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>
#import "LGPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello World!");
        // runtime
        // ro 编译的时候生成的 -- 内存不够的时候
        // rw command+X --- class_rw_ext_t --
        // 分类 -- 分类和本类必须是非懒加载类  -- runtime API
        // 10%
        
        //lldb -- 代码
        //类方法 -- 苹果为什么要设计元类? -- 复用消息机制
        LGPerson *p = [LGPerson alloc];//没有元类 -- 单一职责
        // objc_msgSend(消息的接收者 isa,消息的方法名)  -- 快
        
    }
    return 0;
}
