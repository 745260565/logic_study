//
//  main.m
//  删除链表的倒数第n个结点
//
//  Created by ws on 2022/2/25.
//

#import "SinglyLinkedList.h"

/**
 给定一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点
 输入：head = [1,2,3,4,5], n = 2
 输出：[1,2,3,5]
 输入：head = [1,2], n = 1
 输出：[1]
 */
LinkList removeNthFromEnd(LinkList head, int n) {
    if (n < 1) {
        return head;
    }
    // 快慢指针
    LinkList fast = head->next;
    LinkList slow = head;
    // 快指针先走n步
    for (int i = 0; i < n; ++i) {
        if (!fast) {
            return head;
        }
        fast = fast->next;
    }
    // 双指针同时行走
    while (fast) {
        fast = fast->next;
        slow = slow->next;
    }
    slow->next = slow->next->next;
    return head;
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
    L = removeNthFromEnd(L, 0);
    printList(L);
    return 0;
}
