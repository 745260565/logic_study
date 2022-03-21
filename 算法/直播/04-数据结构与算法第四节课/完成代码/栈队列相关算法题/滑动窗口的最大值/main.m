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
    //数组模拟双端队列，存储下标
    int q[numsSize];
    *returnSize = 0;
    int* ans = malloc(sizeof(int) * (numsSize - k + 1));
    for (int i = 0; i < numsSize; ++i) {
        while (left < right && nums[i] >= nums[q[right - 1]]) {
            right--;
        }
        q[right++] = i;
        // q最左边的索引小于等于当前窗口最左边的索引，肯定不在当前窗口中，要向右移动
        while (q[left] <= i - k) {
            left++;
        }
        if (i >= k - 1) ans[(*returnSize)++] = nums[q[left]];
    }
    return ans;
}


int main(int argc, const char * argv[]) {
    int nums[] = {1,3,-1,-3,5,3,6,7};
    int returnSize = 0;
    int *r = maxSlidingWindow(nums, 8, 3, &returnSize);
    return 0;
}
