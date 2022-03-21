//
//  main.m
//  Deque
//
//  Created by ws on 2022/3/4.
//

#import <Foundation/Foundation.h>
#import "Deque.h"

// 返回的数组 = 窗口的最大值 = 6
// nums  数组
// k 窗口大小
// numsSize 数组大小
// c
NSArray* maxSlidingWindow(int* nums, int numsSize, int k, int* returnSize) {
    NSMutableArray *array = @[].mutableCopy;
    Deque *queue = [[Deque alloc] initWithCapacity:numsSize];
    for (int i = 0; i < numsSize; i++) {
        if (i < k - 1) {
            [queue enqueue:@(nums[i])];
        } else {
            [queue enqueue:@(nums[i])];
            [array addObject:queue.fisrtValue];
            // queue fisrt 不在这个里面
            // i -》窗口的尾巴 -〉窗口的头部 != queue fisrt
            [queue dequeue:@(nums[i - k + 1])];
        }
    }
    *returnSize = array.count;
    return array;
}

int main(int argc, const char * argv[]) {
    int nums[] = {1,3,3,-3,-2,3,6,7};
    int returnSize = 0;
    // 3 3 5 5 6 7
    NSArray *r = maxSlidingWindow(nums, 8, 3, &returnSize);
    return 0;
}

/**
 Deque *deque = [[Deque alloc] initWithCapacity:100];
 [deque enqueue:@(6)];
 [deque enqueue:@(3)];
 [deque enqueue:@(5)];
 NSLog(@"%@", deque);

  NSString *str = @"leetcode is fun";
  // leetcode
  // is
  // fun
  Deque *que = [[Deque alloc] initWithCapacity:100];
  // queue
  NSArray *array = [str componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
  [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
      // 双端队列的头部 +  fun is leetcode
      [que pushValueToHead:obj];
  }];
  NSLog(@"%@", que);

 
 */
