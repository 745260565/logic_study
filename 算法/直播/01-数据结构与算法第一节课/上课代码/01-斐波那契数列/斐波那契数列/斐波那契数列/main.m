//
//  main.m
//  斐波那契数列
//
//  Created by ws on 2022/2/23.
//

#import <Foundation/Foundation.h>

/**
 假设一对兔子每年生一对孩子
 兔宝宝在两年之后才能长大，才能有自己的孩子
 兔子永远不会死
 N年后会有多少只兔子？
 1 1 2 3 5 8
 n = 第n年
 F(n) = F(n-2) + F(n-1)
 3F(n) - 2 = 13行
 n = 45
 */

int fib(int n)
{
    if (n <= 2) return 1;
    else return fib(n-1) +fib(n-2);
}
/**
 Dp ->动态规划
 3 + n-1 + n-2 = 2n
 O(n)
 */
int fib2(int n)
{
    int f[n+1];
    f[1] = f[2] = 1;
    for (int i = 3; i <= n; i++)
        f[i] = f[i-1] + f[i-2];
    return f[n];
}

/**
 Dp ->动态规划
 
 O(n)
 */
int fib3(int n)
{
    int a = 1, b = 1;
    for (int i = 3; i <=n ; i++) {
        int c = a + b;
        a = b;
        b = c;
    }
    return b;
}

struct Matrix {
    int mat[2][2];
};

struct Matrix matrixMultiply(struct Matrix* a, struct Matrix* b) {
    struct Matrix c;
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            c.mat[i][j] = (*a).mat[i][0] * (*b).mat[0][j] + (*a).mat[i][1] * (*b).mat[1][j];
        }
    }
    return c;
}
// m^n =
void matpow(int n, struct Matrix *m) {
    struct Matrix q;
    q.mat[0][0] = q.mat[0][1] = q.mat[1][0] = 1;
    q.mat[1][1] = 0;
    for (int i = 0; i < n; i++)
        *m = matrixMultiply(m, &q);
}

/**
 矩阵
 时间复杂度：O(n)。
 空间复杂度：O(1)。
 */
int fib4(int n)
{
    if (n < 2) {
      return n;
    }
    // 单位矩阵
    struct Matrix ret;
    ret.mat[0][0] = ret.mat[1][1] = 1;
    ret.mat[0][1] = ret.mat[1][0] = 0;
    matpow(n-1, &ret);
    return ret.mat[0][0];
}
/**
 O(logn)
 O(n)
            n = 8 *1/2 = 4
 m^n = 2^n = 2^8 =    (2⁴)² = ((2²)²)²
 (2⁴)² * 2
  */
void matpow2(int n, struct Matrix *m) {
    if (n > 1) {
        matpow2(n/2, m);
        *m = matrixMultiply(m, m);
    }
    //
    if (n & 1) {
        struct Matrix q;
        q.mat[0][0] = q.mat[0][1] = q.mat[1][0] = 1;
        q.mat[1][1] = 0;
        *m = matrixMultiply(m, &q);
    }
}
/**
 通项公式
 O(1)
 */
int fib6(int n) {
    double sqrt5 = sqrt(5);
    double fibN = pow((1 + sqrt5) / 2, n) - pow((1 - sqrt5) / 2, n);
    return round(fibN / sqrt5);
}

int main(int argc, const char * argv[]) {
    
    int m = fib(45);
    // m = F(45)
    return 0;
}

/**
 1. 我能想到的
 2. 我不能想到的
 里扣 -》有时间 -〉慢慢积累的事情
 */
