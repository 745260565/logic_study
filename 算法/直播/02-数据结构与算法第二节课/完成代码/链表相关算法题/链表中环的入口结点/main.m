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

int hasCycle(LinkList head) {
    // 快慢指针初始化指向 head
    LinkList slow = head, fast = head;
    // 快指针走到末尾时停止
    while (fast != NULL && fast->next != NULL) {
        // 慢指针走一步，快指针走两步
        slow = slow->next;
        fast = fast->next->next;
        // 快慢指针相遇，说明含有环
        if (slow == fast) {
            return 1;
        }
    }
    // 不包含环
    return 0;
}

LinkList detectCycle(LinkList head) {
    // 定义快慢指针
    LinkList slow = head;
    LinkList fast = head;
    while (fast != NULL && fast->next != NULL) {
        slow = slow->next;
        // 若是快指针指向null，则不存在环
        if (fast->next == NULL) {
            return NULL;
        }
        // 快指针是慢指针的两倍速度
        fast = fast->next->next;
        if (fast == slow) {
            LinkList ptr = head;
            // 与第一次相遇的结点相同速度出发，相遇结点为入口结点
            while (ptr != slow) {
                ptr = ptr->next;
                slow = slow->next;
            }
            return ptr;
        }
    }
    return NULL;
}
/**
 class Solution {
 public:
     ListNode *detectCycle(ListNode *head) {
         ListNode *fast = head, *slow = head;
         while (true) {
             if (fast == nullptr || fast->next == nullptr) return nullptr;
             fast = fast->next->next;
             slow = slow->next;
             if (fast == slow) break;
         }
         fast = head;
         while (slow != fast) {
             slow = slow->next;
             fast = fast->next;
         }
         return fast;
     }
 };
 */

int main(int argc, const char * argv[]) {
    Status iStatus;
    LinkList L;
    iStatus = createLinkList(&L);
    for(int j=1; j<=10; j++)
    {
        insertElemByIndex(&L, 1, j);
    }
    LinkList lastnode = getNodeByIndex(L, 8);
    lastnode->next = getNodeByIndex(L, 4);
//    L = detectCycle(L);
    printf("%d\n", hasCycle(L));
    return 0;
}
