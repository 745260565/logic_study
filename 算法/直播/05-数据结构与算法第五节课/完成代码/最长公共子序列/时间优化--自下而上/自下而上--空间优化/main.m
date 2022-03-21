//
//  main.m
//  自下而上--空间优化
//
//  Created by ws on 2022/3/9.
//

#import <Foundation/Foundation.h>

int lcs_length(char * A, char * B)
{
    int m = strlen(A), n = strlen(B);
    int max = MAX(m, n);
    int *X = malloc((max + 1) * sizeof(int));
    int *Y;
    for (int i = m; i >= 0; i--)
    {
        for (int j = n; j >= 0; j--)
        {
            if (A[i] == '\0' || B[j] == '\0') X[j] = 0;
            else if (A[i] == B[j]) X[j] = 1 + Y[j+1];
            else X[j] = MAX(Y[j], X[j+1]);
        }
        Y = X;
    }
    free(X);
    return X[0];
}

int main(int argc, const char * argv[]) {
    char *a = "ermerm";
    char *b = "eern";
    int m = lcs_length(a, b);
    return 0;
}
