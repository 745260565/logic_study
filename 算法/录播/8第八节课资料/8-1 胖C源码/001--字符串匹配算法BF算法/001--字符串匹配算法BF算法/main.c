//
//  main.c
//  001--BF算法
//
//  Created by CC老师 on 2019/10/29.
//  Copyright © 2019年 CC老师. All rights reserved.
//
//
//  main.c
//  001--字符串基本操作实现
//
//  Created by CC老师 on 2019/10/21.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#include "string.h"
#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include "time.h"

#define OK 1
#define ERROR 0
#define TRUE 1
#define FALSE 0

#define MAXSIZE 40    /* 存储空间初始分配量 */
typedef int Status;   /* Status是函数的类型,其值是函数结果状态代码，如OK等 */
typedef int ElemType; /* ElemType类型根据实际情况而定，这里假设为int */
typedef char String[MAXSIZE+1]; /*  0号单元存放串的长度 */

/* 生成一个其值等于chars的串T */
Status StrAssign(String T,char *chars)
{
    int i;
    if(strlen(chars)>MAXSIZE)
        return ERROR;
    else
    {
        T[0]=strlen(chars);
        for(i=1;i<=T[0];i++)
            T[i]=*(chars+i-1);
        return OK;
    }
}

Status ClearString(String S)
{
    S[0]=0;/*  令串长为零 */
    return OK;
}

/*  输出字符串T。 */
void StrPrint(String T)
{
    int i;
    for(i=1;i<=T[0];i++)
        printf("%c",T[i]);
    printf("\n");
}

/*  输出Next数组值。 */
void NextPrint(int next[],int length)
{
    int i;
    for(i=1;i<=length;i++)
        printf("%d",next[i]);
    printf("\n");
}

/* 返回串的元素个数 */
int StrLength(String S)
{
    return S[0];
}

/*
 1. BF算法-爆发匹配算法
 思路:
 1. 分别利用计数指针i和j指示主串S和模式T中当前正待比较的字符位置,i初值为pos,j的初值为1;
 2. 如果2个串均为比较到串尾,即i和j均小于等于S和T的长度时, 则循环执行以下的操作:
 * S[i]和T[j]比较,若相等,则i 和 j分别指示串中下一个位置,继续比较后续的字符;
 * 若不相等,指针后退重新开始匹配. 从主串的下一个字符串(i = i - j + 2)起再重新和模式第一个字符(j = 1)比较;
 3. 如果j > T.length, 说明模式T中的每个字符串依次和主串S找中的一个连续字符序列相等,则匹配成功,返回和模式T中第一个字符的字符在主串S中的序号(i-T.length);否则匹配失败,返回0;
 */

int Index_BF(String S, String T,int pos){
    
    //i用于主串S中当前位置下标值，若pos不为1，则从pos位置开始匹配
    int i = pos;
    //j用于子串T中当前位置下标值
    int j = 1;
    
    //若i小于S的长度并且j小于T的长度时，循环继续
    while (i <= S[0] && j <= T[0]) {
        
        //比较的2个字母相等,则继续比较
        if (S[i] == T[j]) {
            i++;
            j++;
        }else
        {
            //不相等,则指针后退重新匹配
            
            //i 退回到上次匹配的首位的下一位;
            //加1,因为是子串的首位是1开始计算;
            //再加1的元素,从上次匹配的首位的下一位;
            i = i-j+2;
            
            //j 退回到子串T的首位
            j = 1;
        }}
    
    //如果j>T[0],则找到了匹配模式
    if (j > T[0]) {
        //i母串遍历的位置 - 模式字符串长度 = index 位置
        return  i - T[0];
    }else{
        return -1;
    }
    
}


int main(int argc, const char * argv[]) {
    // insert code here...
    printf("字符串模式匹配!\n");
    
    int i,*p;
    String s1,s2;
    
    StrAssign(s1, "abcdex");
    printf("s1子串为");
    StrPrint(s1);
    
    
    StrAssign(s2, "xe");
    printf("s2子串为");
    StrPrint(s2);
    
    i = Index_BF(s1, s2, 1);
    printf("i = %d\n",i);
    
    return 0;
}
