//
//  main.m
//  滑动窗口的最大值
//
//  Created by ws on 2022/3/4.
//

#import <Foundation/Foundation.h>

int* maxSlidingWindow(int* nums, int numsSize, int k, int* returnSize) {
    //数组q的一左一右
    //左边存储的当前队列最大
    //右边存储的当前队列最小
    int left = 0, right = 0;
    //数组模拟单调队列，存储下标
    int q[numsSize];
    int* ans = malloc(sizeof(int) * (numsSize - k + 1));
    *returnSize = 0;
    for (int i = 0; i < numsSize; i++) {
        // 单调队列最右值（nums[q[right]]）小于 当前窗口进来的这个值nums[i]
        /**
         i = 0 left = 0 right = 0
         i = 1 left = 0 right = 1
         nums[1]  nums[1]
         */
        while (left < right && nums[i] >= nums[q[right -1]]) {
            right--;
        }
        //  比right小
        q[right] = i;
        // right = 0
        right++;
        // 单调队列最左值q[left]不在当前的窗口内
        // left++
        // i 窗口的末尾 判断窗口头部i q[left]
        while (q[left] < i - k + 1) {
            left++;
        }
        if (i >= k-1) {
            //单调队列最左值 存起来
            ans[*returnSize] = nums[q[left]];
            *returnSize = *returnSize + 1;
        }
    }

    
    return ans;
}


int main(int argc, const char * argv[]) {
    int nums[] =  {1,3,3,-3,-2,3,6,7};
    int returnSize = 0;
    int *r = maxSlidingWindow(nums, 8, 3, &returnSize);
    return 0;
}
