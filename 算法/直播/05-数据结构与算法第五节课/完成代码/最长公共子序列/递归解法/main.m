//
//  main.m
//  递归解法
//
//  Created by ws on 2022/3/9.
//

#import <Foundation/Foundation.h>

int lcs_length(char *A, char *B)
{
    if (*A == '\0' || *B == '\0') return 0;
    else if (*A == *B) return 1 + lcs_length(A+1, B+1);
    else return MAX(lcs_length(A+1,B), lcs_length(A,B+1));
}

char * A;
char * B;
int subproblem(int i, int j)
{
    if (A[i] == '\0' || B[j] == '\0') return 0;
    else if (A[i] == B[j]) return 1 + subproblem(i+1, j+1);
    else return MAX(subproblem(i+1, j), subproblem(i, j+1));
}


int lcs_length2(char * AA, char * BB)
{
    A = AA; B = BB;
    return subproblem(0, 0);
}


int main(int argc, const char * argv[]) {
    
    char *a = "e1";
    char *b = "e";
    int m = lcs_length(a, b);
    return 0;
}
