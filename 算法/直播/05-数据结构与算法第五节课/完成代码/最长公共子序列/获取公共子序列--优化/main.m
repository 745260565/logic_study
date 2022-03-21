//
//  main.m
//  获取公共子序列--优化
//
//  Created by ws on 2022/3/9.
//

#import <Foundation/Foundation.h>

char *lcs(char * A, char * B)
{
    int m = strlen(A), n = strlen(B);
    long L[m + 1][n + 1];
    memset(L, 0, sizeof(L));
    for (int i = 0; i <= m; i++) {
        L[i][n] = 1;
    }

    for (int i = 1; i <= m; i++) {
        for (int j = 1; j <= n; j++) {
            if (A[i - 1] == B[j - 1]) {
                L[i][j] = L[i - 1][j - 1] + 1;
            } else {
                L[i][j] = MAX(L[i - 1][j], L[i][j - 1]);
            }
        }
    }
    
    int t = L[m][n];
    char *s = malloc(t);
    int i, j, k;
    for (i = m, j = n, k = t - 1; k >= 0;) {
        if (A[i - 1] == B[j - 1]) {
            s[k] = A[i - 1];
            i--;
            j--;
            k--;
        }
        else if (L[i][j - 1] > L[i - 1][j]){
            j--;
        }
        else
            i--;
    }
    return s;
}

int main(int argc, const char * argv[]) {
    char *a = "nematode knowledge";
    char *b = "empty bottle";
    char *m = lcs(a, b);
    return 0;
}
