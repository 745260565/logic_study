//
//  main.m
//  时间优化--自上而下
//
//  Created by ws on 2022/3/9.
//

#import <Foundation/Foundation.h>

char *A;
char *B;
int **L;
int subproblem(int i, int j)
{
    if (L[i][j] < 0) {
        if (A[i] == '\0' || B[j] == '\0') L[i][j] = 0;
        else if (A[i] == B[j]) L[i][j] = 1 + subproblem(i+1, j+1);
        else L[i][j] = MAX(subproblem(i+1, j), subproblem(i, j+1));
    }
    return L[i][j];
}

int lcs_length(char * AA, char * BB)
{
    A = AA; B = BB;
    int m = strlen(A), n = strlen(B);
    int *z = malloc(sizeof (int) * (n + 1) * (m + 1));
    memset(z, -1, sizeof (int) * (n + 1) * (m + 1));
    L = calloc((m + 1), sizeof(int *));
    for (int i = 0; i <= m; i++) {
        L[i] = &z[i * (n + 1)];
    }
    return subproblem(0, 0);
}

int main(int argc, const char * argv[]) {
    char *a = "ermer";
    char *b = "eer";
    int m = lcs_length(a, b);
    return 0;
}
