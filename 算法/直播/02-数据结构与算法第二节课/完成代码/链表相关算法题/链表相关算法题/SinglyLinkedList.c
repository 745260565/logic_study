//
//  SinglyLinkedList.c
//  链表相关算法题
//
//  Created by ws on 2022/2/25.
//

#include "SinglyLinkedList.h"
#include "string.h"
#include "ctype.h"
#include "stdlib.h"
#include "math.h"
#include "time.h"

#define ERROR 0
#define TRUE 1
#define FALSE 0
#define OK 1

#define MAXSIZE 20 /* 存储空间初始分配量 */



Status createLinkList(LinkList *L) {
    
    //产生头结点,并使用L指向此头结点
    *L = (LinkList)calloc(1, sizeof(Node));
    //存储空间分配失败
    if(*L == NULL) return ERROR;
    //将头结点的指针域置空
    (*L)->next = NULL;
    
    return OK;
}
Status insertElemByIndex(LinkList *L, int i ,ElemType e) {
 
    int j;
    LinkList p,s;
    p = *L;
    j = 1;
    
    //寻找第i-1个结点
    while (p && j<i) {
        p = p->next;
        ++j;
    }
    
    //第i个元素不存在
    if(!p || j>i) return ERROR;
    
    //生成新结点s
    s = (LinkList)calloc(1, sizeof(Node));
    //将e赋值给s的数值域
    s->data = e;
    //将p的后继结点赋值给s的后继
    s->next = p->next;
    //将s赋值给p的后继
    p->next = s;
    
    return OK;
}

LinkList getNodeByIndex(LinkList L, int i) {
    
    //j: 计数.
    int j;
    //声明结点p;
    LinkList p;
    
    //将结点p 指向链表L的第一个结点;
    p = L->next;
    //j计算=1;
    j = 1;
    
    
    //p不为空,且计算j不等于i,则循环继续
    while (p && j<i) {
        
        //p指向下一个结点
        p = p->next;
        ++j;
    }
    
    //如果p为空或者j>i,则返回error
    if(!p || j > i) return NULL;
    
    return p;
}

void printList(LinkList L)
{
    printf("[");
    LinkList p=L->next;
    while(p)
    {
        printf("%d", p->data);
        p=p->next;
        if(p) {
            printf(", ");
        }
    }
    printf("]\n");
}
