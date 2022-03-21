//
//  main.m
//  获取公共子序列
//
//  Created by ws on 2022/3/9.
//

#import <Foundation/Foundation.h>


char *lcs(char * A, char * B)
{
    int m = strlen(A), n = strlen(B);
    int L[m + 1][n + 1];
    for (int i = m; i >= 0; i--) {
        for (int j = n; j >= 0; j--)
        {
            if (A[i] == '\0' || B[j] == '\0') L[i][j] = 0;
            else if (A[i] == B[j]) L[i][j] = 1 + L[i+1][j+1];
            else L[i][j] = MAX(L[i+1][j], L[i][j+1]);
        }
    }
    char *S = malloc(MAX(m, n));
    int i = 0,j = 0, index = 0;
    while (i < m && j < n)
    {
        if (A[i]==B[j])
        {
            S[index++] = A[i];
            i++; j++;
        }
        else if (L[i+1][j] >= L[i][j+1]) i++;
        else j++;
    }
    return S;
}


int main(int argc, const char * argv[]) {
    char *a = "nematode knowledge";
    char *b = "empty bottle";
    char *m = lcs(a, b);
    return 0;
}
