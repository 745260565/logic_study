//
//  main.m
//  链表中环的入口结点
//
//  Created by ws on 2022/2/25.
//

#import "SinglyLinkedList.h"

/**
 给定一个链表，长度为n，若其中包含环，请找出该链表的环的入口结点。如果链表无环，则返回 null。
 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。
 如果 pos 是 -1，则在该链表中没有环。
 注意，pos 仅仅是用于标识环的情况，并不会作为参数传递到函数中。
 不允许修改给定的链表。

 输入：head = [1,2,3,4,5], pos = 1
 输出：返回索引为 1 的链表节点
 */
// 时间：O(n)
// 空间：O(1)
int hasCycle(LinkList head) {
    LinkList slow = head, fast = head;
    while (fast != NULL && fast->next != NULL) {
        slow = slow->next;
        fast = fast->next->next;
        if (slow == fast) {
            return 1;
        }
    }
    return 0;
}

LinkList detectCycle(LinkList head) {
    LinkList slow = head, fast = head;
    while (1) {
        if (fast != NULL && fast->next != NULL) {
            slow = slow->next;
            fast = fast->next->next;
            // slow = nb
            // fast = 2nb
            if (slow == fast) {
                break;
            }
        } else {
            return NULL;
        }
    }
    
    fast = head;
    // a
    while (slow != fast) {
        slow = slow->next;
        fast = fast->next;
    }
    return fast;
}

int main(int argc, const char * argv[]) {
    Status iStatus;
    LinkList L;
    // 创建单链表
    iStatus = createLinkList(&L);
    for(int j=1; j<=10; j++)
    {
        // 单链表添加数据
        insertElemByIndex(&L, 1, j);
    }
    printList(L);
    //最后一个节点
    LinkList lastnode = getNodeByIndex(L, 10);
    // 第4节点
    lastnode->next = getNodeByIndex(L, 9);
    L = detectCycle(L);
    printf("%d\n", L->data);
    return 0;
}

