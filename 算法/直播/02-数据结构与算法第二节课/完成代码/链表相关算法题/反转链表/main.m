//
//  main.m
//  反转链表
//
//  Created by ws on 2022/2/25.
//

#import "SinglyLinkedList.h"
/**
 给定一个单链表，长度为n，反转该链表后，返回新链表的表头
 输入：head = [1,2,3,4,5]
 输出：[5,4,3,2,1]
 输入：head = [1,2]
 输出：[2,1]
 */
void reverseList(LinkList *L) {
    //新链表
    LinkList pHead = NULL;
    LinkList head = (*L)->next;
    while (head != NULL) {
       //保存访问的结点的下一个节点
       LinkList temp = head->next;
       //每次访问的原链表节点都会成为新链表的头结点
       head->next = pHead;
       //更新新链表
       pHead = head;
       //重新赋值，继续访问
       head = temp;
     }
   (*L)->next = pHead;
}

LinkList recur(LinkList head, LinkList newHead) {
    if (head != NULL) {
        LinkList cur = recur(head->next, head);
        head->next = newHead;
        return cur;
    }
   return newHead;
}

void reverseList2(LinkList *L) {
    (*L)->next = recur((*L)->next, NULL);
}

int main(int argc, const char * argv[]) {
    Status iStatus;
    LinkList L;
    iStatus = createLinkList(&L);
    for(int j=1; j<=10; j++)
    {
        insertElemByIndex(&L, 1, j);
    }
    printList(L);
    reverseList2(&L);
    printList(L);
    return 0;
}
