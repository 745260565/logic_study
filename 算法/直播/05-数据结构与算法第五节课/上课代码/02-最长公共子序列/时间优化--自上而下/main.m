//
//  main.m
//  时间优化--自上而下
//
//  Created by ws on 2022/3/9.
//

#import <Foundation/Foundation.h>


// 有重复再解决的问题
// 子问题
char *A;
char *B;
int **L;
// L[0] = [1,2,3]
// L[1] = [4,5,6]
// [[1,2,3],[4,5,6]]
// [1,2,3,4,5,6]
// 时间复杂度 L全部填满的 O（m * n）
int subProblem(int i, int j) {
    if (L[i][j] < 0) {
        // 没有缓存计算结果
        if (A[i] == '\0' || B[j] == '\0') L[i][j] = 0;
        else if (A[i] == B[j]) L[i][j] = 1 + subProblem(i+1, j+1);
        else L[i][j] = MAX(subProblem(i+1, j), subProblem(i, j+1));
    }
    return L[i][j];
}

int lcs_length(char *AA, char *BB) {
    A = AA; B = BB;
    int m = strlen(A), n = strlen(B);
    // 一维数组
    int *z = malloc(sizeof(int) * (m + 1) * (n + 1));
    memset(z, -1, sizeof(int) * (m + 1) * (n + 1));
    L = calloc((m + 1), sizeof(int *));
    for (int i = 0; i <= m; i++) {
        // 传递的二维数组每一组的头指针
        L[i] = &z[i * (n + 1)];
    }
    // a = [1,2,3] , b = [4,5,6]
    // L = []
    // L[1] = a
    // L[2] = b
    return subProblem(0, 0);
}
//

int main(int argc, const char * argv[]) {
    // 二维数组 = []
    // [] =
    char *a = "re";
    char *b = "e";
    // L[0][0] = 0;
    int m = lcs_length(a, b);
    return 0;
}
