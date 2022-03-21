//
//  main.m
//  时间优化--自下而上
//
//  Created by ws on 2022/3/9.
//

#import <Foundation/Foundation.h>

int lcs_length(char * A, char * B) {
    int m = strlen(A), n = strlen(B);
    int L[m + 1][n + 1];
    for (int i = m; i >= 0; i--)
        for (int j = n; j >= 0; j--)
        {
            if (A[i] == '\0' || B[j] == '\0') L[i][j] = 0;
            else if (A[i] == B[j]) L[i][j] = 1 + L[i+1][j+1];
            else L[i][j] = MAX(L[i+1][j], L[i][j+1]);
        }
    return L[0][0];
}

int main(int argc, const char * argv[]) {
    char *a = "ermer";
    char *b = "eer";
    int m = lcs_length(a, b);
    return 0;
}
