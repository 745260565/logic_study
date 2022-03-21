//
//  main.m
//  递归解法
//
//  Created by ws on 2022/3/9.
//

#import <Foundation/Foundation.h>

int lcs_length(char *A, char *B)
{
    // 最长公共子序列的长度
    // A:em
    // B:em
    //
    if (*A == '\0' || *B == '\0') {
        return 0;
    }
    // 字符相等情况下
    if (*A == *B) {
        return 1 + lcs_length(A+1, B+1);
    } else {
        // 字符不相等
        return MAX(lcs_length(A, B+1), lcs_length(A + 1, B) );
    }
    return 0;
}
// 
char *A;
char *B;
//子问题： index i,j字符相等/不想等
int subProblem(int i, int j) {
    if (A[i] == '\0' || B[j] == '\0') return 0;
    else if (A[i] == B[j]) return 1 + subProblem(i+1, j+1);
    else return MAX(subProblem(i+1, j), subProblem(i, j+1));
}

int lcs_length1(char *AA, char *BB) {
    A = AA; B = BB;
    return subProblem(0, 0);
}

/**
 A: o m
 B: m u
 o != m
 A(o) + 1 = A(m)
 A(m) 比较 B(m) lcs_l = 1
 B(m) + 1 = B(u)
 B(u) 比较  A(o) lcs_l = 0
 */



//  1 + 0 +1 = 2

int main(int argc, const char * argv[]) {
    // lcs_l = e m t  o l e
    char *a = "eom";
    char *b = "eamm";
    int m = lcs_length(a, b);
    return 0;
}
