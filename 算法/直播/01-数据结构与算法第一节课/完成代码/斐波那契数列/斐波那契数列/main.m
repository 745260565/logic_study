//
//  main.m
//  斐波那契数列
//
//  Created by ws on 2022/2/23.
//

#import <Foundation/Foundation.h>

/**
 递归
 时间复杂度：O(2^n)。
 */
int fib(int n)
{
    if (n <= 2)  return 1;
    else return fib(n-1) + fib(n-2);
}

/**
 动态规划
 时间复杂度：O(n)。
 空间复杂度：O(n)。
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
 动态规划
 时间复杂度：O(n)。
 空间复杂度：O(1)。
 */
int fib3(int n)
{
    int a = 1, b = 1;
    for (int i = 3; i <= n; i++) {
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

void matpow(int n, struct Matrix *m)
{
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
    struct Matrix ret;
    ret.mat[0][0] = ret.mat[1][1] = 1;
    ret.mat[0][1] = ret.mat[1][0] = 0;
    matpow(n-1, &ret);
    return ret.mat[0][0];
}

void matpow2(int n, struct Matrix *m)
{
    if (n > 1) {
        matpow(n/2, m);
        *m = matrixMultiply(m, m);
    }
    if (n & 1) {
        struct Matrix q;
        q.mat[0][0] = q.mat[0][1] = q.mat[1][0] = 1;
        q.mat[1][1] = 0;
        *m = matrixMultiply(m, &q);;
    }
}
/**
 矩阵
 时间复杂度：O(logn)。
 空间复杂度：O(1)。
 */
int fib5(int n)
{
    struct Matrix ret;
    ret.mat[0][0] = ret.mat[1][1] = 1;
    ret.mat[0][1] = ret.mat[1][0] = 0;
    matpow2(n-1, &ret);
    return ret.mat[0][0];
}


/**
 通项公式
 */
int fib6(int n) {
    double sqrt5 = sqrt(5);
    double fibN = pow((1 + sqrt5) / 2, n) - pow((1 - sqrt5) / 2, n);
    return round(fibN / sqrt5);
}


int main(int argc, const char * argv[]) {
    
    int m = fib4(1);
    return 0;
}

