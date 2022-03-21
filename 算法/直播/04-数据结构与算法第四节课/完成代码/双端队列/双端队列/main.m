//
//  main.m
//  双端队列
//
//  Created by ws on 2022/3/4.
//

#import <Foundation/Foundation.h>
#import "Deque.h"

NSArray* maxSlidingWindow(int* nums, int numsSize, int k, int* returnSize) {
    NSMutableArray *array = @[].mutableCopy;
    Deque *deque = [[Deque alloc] initWithCapacity:100];

    for (int i = 0; i < numsSize; i++) {
        if (i < k - 1) {
            //先填满窗口的前 k - 1
            [deque enqueue:@(nums[i])];
        } else {
            // 窗口向前滑动，加入新数字
            [deque enqueue:@(nums[i])];
            [array addObject:deque.fisrtValue];
            // 队列已经存在的fisrtValue是否超出当前窗口
            [deque dequeue:@(nums[i - k + 1])];
        }
    }
    return array;
}

int main(int argc, const char * argv[]) {
    int nums[] = {1,3,-1,-3,5,3,6,7};
    int returnSize = 0;
    NSArray *r = maxSlidingWindow(nums, 8, 3, &returnSize);
    
    NSString *str = @"leetcode is fun";
    Deque *deque = [[Deque alloc] initWithCapacity:100];
    [deque enqueue:@(3)];
    [deque enqueue:@(5)];
    [deque enqueue:@(6)];


//    NSMutableString *work = @"".mutableCopy;
//
//    NSArray *array = [str componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//
//    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [deque pushValueToHead:obj];
//    }];
   NSLog(@"%@", deque);
    return 0;
}
