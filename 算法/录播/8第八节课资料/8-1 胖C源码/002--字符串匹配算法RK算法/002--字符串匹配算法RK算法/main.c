//
//  main.c
//  003--RK匹配算法
//
//  Created by CC老师 on 2019/10/29.
//  Copyright © 2019年 CC老师. All rights reserved.
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//d 表示进制
#define d 26

//4.为了杜绝哈希冲突. 当前发现模式串和子串的HashValue 是一样的时候.还是需要二次确认2个字符串是否相等.
int isMatch(char *S, int i, char *P, int m)
{
    int is, ip;
    for(is=i, ip=0; is != m && ip != m; is++, ip++)
        if(S[is] != P[ip])
            return 0;
    return 1;
}

//3.算出最d进制下的最高位
//d^(m-1)位的值;
int getMaxValue(int m){
    int h = 1;
    for(int i = 0;i < m - 1;i++){
        h = (h*d);
    }
    
    return h;
}

/*
 * 字符串匹配的RK算法
 * Author：Rabin & Karp
 * 若成功匹配返回主串中的偏移，否则返回-1
 */
int RK(char *S, char *P)
{
    //1. n:主串长度, m:子串长度
    int m  = (int) strlen(P);
    int n  = (int) strlen(S);
    printf("主串长度为:%d,子串长度为:%d\n",n,m);
    
    //A.模式串的哈希值; St.主串分解子串的哈希值;
    unsigned int A   = 0;
    unsigned int St  = 0;
    
    //2.求得子串与主串中0~m字符串的哈希值[计算子串与主串0-m的哈希值]
    //循环[0,m)获取模式串A的HashValue以及主串第一个[0,m)的HashValue
    //此时主串:"abcaadddabceeffccdd" 它的[0,2)是ab
    //此时模式串:"cc"
    //cc = 2 * 26^1 + 2 *26 ^0 = 52+2 = 54;
    //ab = 0 * 26^1 + 1 *26^0 = 0+1 = 1;
    
    for(int i = 0; i != m; i++){
        //第一次 A = 0*26+2;
        //第二次 A = 2*26+2;
        A = (d*A + (P[i] - 'a'));
        
        //第一次 st = 0*26+0
        //第二次 st = 0*26+1
        St = (d*St + (S[i] - 'a'));
        
    }
    
    //3. 获取d^m-1值(因为经常要用d^m-1进制值)
    int hValue = getMaxValue(m);
    
    //4.遍历[0,n-m], 判断模式串HashValue A是否和其他子串的HashValue 一致.
    //不一致则继续求得下一个HashValue
    //如果一致则进行二次确认判断,2个字符串是否真正相等.反正哈希值冲突导致错误
    //注意细节:
    //① 在进入循环时,就已经得到子串的哈希值以及主串的[0,m)的哈希值,可以直接进行第一轮比较;
    //② 哈希值相等后,再次用字符串进行比较.防止哈希值冲突;
    //③ 如果不相等,利用在循环之前已经计算好的st[0] 来计算后面的st[1];
    //④ 在对比过程,并不是一次性把所有的主串子串都求解好Hash值. 而是是借助s[i]来求解s[i+1] . 简单说就是一边比较哈希值,一边计算哈希值;
    
    for(int i = 0; i <= n-m; i++){
        if(A == St)
            if(isMatch(S,i,P,m))
                //加1原因,从1开始数
                return i+1;
        St = ((St - hValue*(S[i]-'a'))*d + (S[i+m]-'a'));
        
    }
    
    return -1;
}

int main()
{
    char *buf="abcababcabx";
    char *ptrn="abcabx";
    printf("主串为%s\n",buf);
    printf("子串为%s\n",ptrn);
    
    int index = RK(buf, ptrn);
    printf("find index : %d\n",index);
    
    return 1;
}
