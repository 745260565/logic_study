//
//  main.m
//  alloc_test
//
//  Created by chenghao on 2022/4/15.
//

#import <Foundation/Foundation.h>
#import "FMUserInfo.h"
#import <malloc/malloc.h>
#import <objc/runtime.h>
#import "FMTestObject1.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        FMUserInfo *user1 = [[FMUserInfo alloc]init];
//        NSLog(@"user1 实际运行内存分配大小为：%lu",malloc_size((__bridge const void *)(user1)));
//        FMUserInfo *user2 = [[FMUserInfo alloc]init];
//        user2.name = @"zhangsan";
//        user2.address = @"SD";
//        user2.age = 18;
//        user2.hight = 180.0;
//        user2.number = 120;
//        user2.sex = 1;
//        NSLog(@"user2 实际运行内存分配大小为：%lu",malloc_size((__bridge const void *)(user2)));
//        NSLog(@"创建的FMUserInfo类型对象所有实例变量实际占用的内存大小：%lu", class_getInstanceSize([FMUserInfo class]));
        
//        FMTestObject1 *objc1 = [[FMTestObject1 alloc] init];
//        NSLog(@"objc1实际占用的内存空间为%zd",class_getInstanceSize([FMTestObject1 class]));
////        NSLog(@"系统为objc1开辟的内存空间为%zd",malloc_size((__bridge const void *)objc1));
//        union Un1
//        {
//            char c[5];//1个char类型占1字节，5个占5字节
//            int i;//4字节
//        } un1;
//        union Un2
//        {
//            short c[7];//1个short类型占2字节，7个占14字节
//            int i;//4字节
//        }un2;
//
//
//        NSLog(@"%lu",sizeof(un1));
//        NSLog(@"%lu",sizeof(un2));
        
        FMUserInfo *p = [FMUserInfo alloc];
        NSLog(@"%p",p);
    }
    return 0;
}


//union Un//联合类型的声明,union是联合体关键字
//{
//    char c;//1字节
//    int i;//4字节
//}un1;
