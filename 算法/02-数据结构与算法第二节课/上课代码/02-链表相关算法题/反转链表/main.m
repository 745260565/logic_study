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
    LinkList pHead = NULL;
    LinkList head = (*L)->next;
    while (head) {
        LinkList temp = head->next;
        head->next = pHead;
        pHead = head;
        head = temp;
    }
    // 链表的头部
    //  (*L)->虚拟头节点
    (*L)->next = pHead;
}

// 递归 -》
int main(int argc, const char * argv[]) {
    Status iStatus;
    LinkList L;
    iStatus = createLinkList(&L);
//    for(int j=1; j<=10; j++)
//    {
//        insertElemByIndex(&L, 1, j);
//    }
    printList(L);
    reverseList(&L);
    printList(L);
    return 0;
}
