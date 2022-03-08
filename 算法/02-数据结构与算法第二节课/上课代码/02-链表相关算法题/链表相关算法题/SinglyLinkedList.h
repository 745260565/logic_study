//
//  SinglyLinkedList.h
//  链表相关算法题
//
//  Created by ws on 2022/2/25.
//

#ifndef SinglyLinkedList_h
#define SinglyLinkedList_h

#include <stdio.h>

typedef int ElemType;/* ElemType类型根据实际情况而定，这里假设为int */
typedef int Status;/* Status是函数的类型,其值是函数结果状态代码，如OK等 */
//定义结点
typedef struct Node{
    ElemType data;
    struct Node *next;
}Node;


typedef struct Node * LinkList;

// 初始化单链表
extern Status createLinkList(LinkList *L); 
// 单链表插入
Status insertElemByIndex(LinkList *L, int i ,ElemType e);
// 单链表取值
Node *getNodeByIndex(LinkList L, int i);
// 打印单链表
void printList(LinkList L);

#endif /* SinglyLinkedList_h */
