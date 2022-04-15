//
//  main.swift
//  ListNodeDemo
//
//  Created by chenghao on 2022/3/22.
//

import Foundation
import DPDemo

public class ListNode {
    
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int = 0, _ next:  ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

let a = ListNode(9, ListNode(3,ListNode(7,ListNode(2,ListNode(19,ListNode(1,ListNode(8,nil)))))))
let b = ListNode(6,ListNode(3,nil))
let s = Solution()
//s.printListNode(s.addInList(a, b))
//s.printListNode(s.addInList2(a, b))
//s.printListNode(s.FindFirstCommonNode(a, b))
//s.printListNode(s.FindKthToTail(a, 3))
s.sortInList(a)

public class Solution {
    
    
    func printListNode(_ head: ListNode?){
        if head == nil {
            print("空")
        }
        var curr = head
        while(curr != nil) {
            print(curr!.val)
            curr = curr?.next
        }
    }
    
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param head ListNode类
     * @return ListNode类
     */
    func ReverseList ( _ head: ListNode?) -> ListNode? {
        // write code here
        var prev: ListNode? = nil
        var curr: ListNode? = head
        while(curr != nil) {
            let temp = curr?.next
            curr?.next = prev
            prev = curr
            curr = temp
        }
        return prev
    }
    
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param head ListNode类
     * @return bool布尔型
     */
    func hasCycle ( _ head: ListNode?) -> Bool {
        // write code here
        if head == nil {
            return false
        }
        var first: ListNode? = head
        var second: ListNode? = head
        while(first != nil && second?.next != nil) {
            first = first?.next
            second = second?.next?.next
            if(first?.val == second?.val) {
                return true
            }
        }
        return false
    }
    
    
    //牛客 BM2 链表内指定区间反转
    //https://www.nowcoder.com/practice/b58434e200a648c589ca2063f1faf58c?tpId=295&tqId=654&ru=/exam/oj&qru=/ta/format-top101/question-ranking&sourceUrl=%2Fexam%2Foj
    func reverseBetween ( _ head: ListNode?,  _ m: Int,  _ n: Int) -> ListNode? {
        // write code here
        let dummyNode = ListNode(-1, head)
        var pre = dummyNode
        for _ in 0..<m-1 {
            pre = pre.next!
        }
        let cur = pre.next
        var cur_next: ListNode?
        for _ in 0..<n-m {
            cur_next = cur?.next
            cur?.next = cur_next?.next
            cur_next?.next = pre.next
            pre.next = cur_next
        }
        return dummyNode
    }
    
    //BM44 有效括号序列
    //https://www.nowcoder.com/practice/37548e94a270412c8b9fb85643c8ccc2?tpId=295&tqId=726&ru=%2Fpractice%2F6fe0302a058a4e4a834ee44af88435c7&qru=%2Fta%2Fformat-top101%2Fquestion-ranking&sourceUrl=%2Fexam%2Foj
    func isValid ( _ s: String) -> Bool {
        // write code here
//        let array: [Character] = s.map {$0}
        var node : [Character] = []
        if s.count == 0 {
            return false
        }
        for c in s {
            if ["[","{","("].contains(c) || ["]","}",")"].contains(c) {
                if ["[","{","("].contains(c){
                    node.append(c)
                }else {
                    if node.count == 0 {
                        return false
                    } else {
                        let lastCharacter = node.last
                        if(lastCharacter == "[" && c == "]") || (lastCharacter == "{" && c == "}") || (lastCharacter == "(" && c == ")") {
                            node.removeLast()
                        }
                    }
                }
            } else {
                return false
            }
        }
        if node.count == 0 {
            return true
        } else {
            return false
        }
    }
    
    //AB11 合并两个排序的链表
    //https://www.nowcoder.com/practice/d8b6b4358f774294a89de2a6ac4d9337?tpId=308&tqId=23267&ru=/exam/oj&qru=/ta/algorithm-start/question-ranking&sourceUrl=%2Fexam%2Foj%3Ftab%3D%25E7%25AE%2597%25E6%25B3%2595%25E7%25AF%2587%26topicId%3D308
    func Merge ( _ pHead1: ListNode?,  _ pHead2: ListNode?) -> ListNode? {
        // write code here
        if pHead1 == nil {
            return pHead2
        }
        if pHead2 == nil {
            return pHead1
        }
        if(pHead1!.val < pHead2!.val || pHead1?.val == pHead2?.val) {
            pHead1?.next = Merge(pHead1?.next, pHead2)
            return pHead1
        } else {
            pHead2?.next = Merge(pHead1, pHead2?.next)
            return pHead2
        }
    }
    
    func Merge2 ( _ pHead1: ListNode?,  _ pHead2: ListNode?) -> ListNode? {
        // write code here
        if pHead1 == nil {
            return pHead2
        }
        if pHead2 == nil {
            return pHead1
        }
        var p1 = pHead1
        var p2 = pHead2
        let vHead = ListNode.init(-1, nil)
        var cur = vHead
        while((p1 != nil) && (p2 != nil)) {
            if(p1!.val < p2!.val || p1?.val == p2?.val) {
                cur.next = p1
                p1 = p1?.next
            } else {
                cur.next = p2
                p2 = p2?.next
            }
            cur = cur.next!
        }
        cur.next = (p1 == nil) ? p2 : p1
        return vHead.next
    }
    
    
    //BM3 链表中的节点每k个一组翻转
    //https://www.nowcoder.com/practice/b49c3dc907814e9bbfa8437c251b028e?tpId=295&tqId=722&ru=/exam/oj&qru=/ta/format-top101/question-ranking&sourceUrl=%2Fexam%2Foj
    func reverseKGroup ( _ head: ListNode?,  _ k: Int) -> ListNode? {
        // write code here
        if k <= 1 || head == nil {
            return head
        }
        let resultNode = ListNode.init(-1, nil)
        var currentNode = resultNode //当前操作的链表
        var rootNode = head
        var array : [ListNode] = [] //空栈
        var cnt = 0
        while true {
            for _ in 0..<k {
                array.append(rootNode!)
                rootNode = rootNode?.next
                cnt += 1
                if(rootNode == nil) {
                    break
                }
            }//栈中放入了k个ListNode
            if(cnt == k) { //栈中有k个元素则取出
                while(!array.isEmpty) {
                    currentNode.next = array.popLast()
                    currentNode = currentNode.next!
                    currentNode.next = nil
                }
            }
            if(rootNode == nil) {
                break
            }
            cnt = 0
        }
        var end = ListNode()
        let hasEnd = !array.isEmpty
        while(!array.isEmpty) {//栈中最后一个给到end
            end = array.popLast()!
        }
        if(hasEnd) {
            currentNode.next = end
        }
        return resultNode.next
    }
    
    //BM5 合并k个已排序的链表
    //https://www.nowcoder.com/practice/65cfde9e5b9b4cf2b6bafa5f3ef33fa6?tpId=295&tqId=724&ru=/exam/oj&qru=/ta/format-top101/question-ranking&sourceUrl=%2Fexam%2Foj
    //思路：每两个两个合并，数组变成k/2个，然后再两个两个合并，变成k/2个
    func mergeKLists ( _ lists: [ListNode?]) -> ListNode? {
// write code here
        mergeList(lists, 0, lists.count-1)
    }
    
    private func mergeList(_ arrayListList: [ListNode?], _ l: Int, _ r: Int) -> ListNode? {
        if l == r {
            return arrayListList[l]
        }
        if l > r {
            return nil
        }
        let mid = l + (r-l)>>1
        return Merge2(mergeList(arrayListList, l, mid), mergeList(arrayListList, mid+1, r))
    }
    
    
    //BM11 链表相加(二)
    //https://www.nowcoder.com/practice/c56f6c70fb3f4849bc56e33ff2a50b6b?tpId=295&tqId=1008772&ru=/exam/oj&qru=/ta/format-top101/question-ranking&sourceUrl=%2Fexam%2Foj
    //转成int相加再转成链表
    func addInList ( _ head1: ListNode?,  _ head2: ListNode?) -> ListNode? {
        // write code here
        if head1 == nil {
            return head2
        }
        if head2 == nil {
            return head1
        }
        var h1 = 0
        var h2 = 0
        var p1 = head1
        var p2 = head2
        while(p1 != nil) {
            h1 = h1*10 + p1!.val
            p1 = p1?.next
        }
        while(p2 != nil) {
            h2 = h2*10 + p2!.val
            p2 = p2?.next
        }
        var r = h1 + h2
        let rlist = ListNode.init(-1, nil)
        var curList = rlist
        //由个位到十位百位拼成一个链表，再反转
        while(r>0) {
            curList.next = ListNode.init(r%10, nil)
            r /= 10
            curList = curList.next!
        }
        
        //再反转
        var prev: ListNode? = nil
        var curr: ListNode? = rlist.next
        while(curr != nil) {
            let temp = curr?.next
            curr?.next = prev
            prev = curr
            curr = temp
        }
        return prev
        
    }
    
    //使用辅助栈
    func addInList2 ( _ head1: ListNode?,  _ head2: ListNode?) -> ListNode? {
        if head1 == nil {
            return head2
        }
        if head2 == nil {
            return head1
        }
        var stack1 : [Int] = []
        var stack2 : [Int] = []
        var p1 = head1
        var p2 = head2
        while(p1 != nil) {
            stack1.append(p1!.val)
            p1 = p1?.next
        }
        while(p2 != nil) {
            stack2.append(p2!.val)
            p2 = p2?.next
        }
        var temp = 0;//进位
        //取两栈的栈顶相加，再进位后放放到链表尾部
        var head : ListNode?
        while(!stack1.isEmpty || !stack2.isEmpty) {
            var sum = temp
            if(!stack1.isEmpty) {
                sum += stack1.popLast()!
            }
            if(!stack2.isEmpty) {
                sum += stack2.popLast()!
            }
            temp = sum/10
            let node = ListNode(sum%10,nil)
            node.next = head
            head = node
        }
        //处理最后进位
        if temp > 0 {
            let node = ListNode(temp%10,nil)
            node.next = head
            head = node
        }
        return head
    }
    
    
    //BM13 判断一个链表是否为回文结构
    //https://www.nowcoder.com/practice/3fed228444e740c8be66232ce8b87c2f?tpId=295&tqId=1008769&ru=%2Fpractice%2Fc56f6c70fb3f4849bc56e33ff2a50b6b&qru=%2Fta%2Fformat-top101%2Fquestion-ranking&sourceUrl=%2Fexam%2Foj
    //用双指针来实现，先找到中间点
    func isPail ( _ head: ListNode?) -> Bool {
        // write code here
        if head == nil || head?.next == nil {
            return true
        }
        var stack: [Int] = []
        var curr = head
        while curr != nil {
            stack.append(curr!.val)
            curr = curr?.next
        }
        for (idx,_) in stack.enumerated() {
            if(idx<stack.count/2) {
                if stack[idx] == stack[stack.count-1-idx] {
                    continue
                }else {
                    return false
                }
            } else {
                break
            }
        }
        return true
    }
    
    //BM14 链表的奇偶重排
    //https://www.nowcoder.com/practice/02bf49ea45cd486daa031614f9bd6fc3?tpId=295&tqId=1073463&ru=%2Fpractice%2F3fed228444e740c8be66232ce8b87c2f&qru=%2Fta%2Fformat-top101%2Fquestion-ranking&sourceUrl=%2Fexam%2Foj
    func oddEvenList ( _ head: ListNode?) -> ListNode? {
        // write code here
        if head == nil || head?.next == nil || head?.next?.next == nil {
            return head
        }
        var jishu : Bool = true
        let list1 = ListNode(-1,nil)
        let list2 = ListNode(-1,nil)
        var curr = head
        var currList1 = list1
        var currList2 = list2
        while(curr != nil) {
            if jishu {
                currList1.next = ListNode(curr!.val,nil)
                currList1 = currList1.next!
                jishu = false
            } else {
                currList2.next = ListNode(curr!.val,nil)
                currList2 = currList2.next!
                jishu = true
            }
            curr = curr?.next
        }
        //拼接
        currList1.next = list2.next
        return list1.next
    }
    
    //BM15 删除有序链表中重复的元素-I
    //https://www.nowcoder.com/practice/c087914fae584da886a0091e877f2c79?tpId=295&tqId=664&ru=/exam/oj&qru=/ta/format-top101/question-ranking&sourceUrl=%2Fexam%2Foj
    //因为前提是升序链表，相同就删除下一个节点就行
    func deleteDuplicates ( _ head: ListNode?) -> ListNode? {
        // write code here
        if head == nil || head?.next == nil {
            return head
        }
        var curr = head
        while(curr != nil && curr?.next != nil) {
            if curr?.val == curr?.next?.val {
                curr?.next = curr?.next?.next
            } else {
                curr = curr?.next
            }
        }
        return head
    }
    
    //BM16 删除有序链表中重复的元素-II
    //https://www.nowcoder.com/practice/71cef9f8b5564579bf7ed93fbe0b2024?tpId=295&tqId=663&ru=/exam/oj&qru=/ta/format-top101/question-ranking&sourceUrl=%2Fexam%2Foj
    //HashMap解决
    func deleteDuplicates2 ( _ head: ListNode?) -> ListNode? {
        // write code here
        var map : [Int: Int] = [:]
        var currListNode = head
        while currListNode != nil {
            if map[currListNode!.val] != nil {
                map[currListNode!.val]! += 1
            } else {
                map[currListNode!.val] = 1
            }
            currListNode = currListNode?.next
        }
        let resListNode = ListNode.init(-1, nil)
        resListNode.next = head
        var deleListNode = resListNode
        while deleListNode.next != nil {
            if map.keys.contains(deleListNode.next!.val) && map[deleListNode.next!.val]!>1 {
                deleListNode.next = deleListNode.next?.next
            }else {
                deleListNode = deleListNode.next!
            }
        }
        return resListNode.next
    }
    
    //BM10 两个链表的第一个公共结点
    //https://www.nowcoder.com/practice/6ab1d9a29e88450685099d45c9e31e46?tpId=295&tqId=23257&ru=/exam/oj&qru=/ta/format-top101/question-ranking&sourceUrl=%2Fexam%2Foj
    func FindFirstCommonNode ( _ pHead1: ListNode?,  _ pHead2: ListNode?) -> ListNode? {
        // write code here
        if pHead1 == nil || pHead2 == nil {
            return nil
        }
        var p1 = pHead1
        while(p1 != nil) {
            var p2 = pHead2
            while(p2 != nil) {
                if p1 === p2 {
                    return p1
                }
                p2 = p2?.next
            }
            p1 = p1?.next
        }
        return nil
    }
    
    //两个拼接实现
    func FindFirstCommonNode2 ( _ pHead1: ListNode?,  _ pHead2: ListNode?) -> ListNode? {
        // write code here
        if pHead1 == nil || pHead2 == nil {
            return nil
        }
        var p1 = pHead1
        var p2 = pHead2
        while(p1 == nil || p2 == nil || Unmanaged<ListNode>.passUnretained(p1!).toOpaque() != Unmanaged<ListNode>.passUnretained(p2!).toOpaque()) {
            if p1 == nil && p2 == nil {
                return nil
            }
            (p1 != nil) ? (p1 = p1?.next) : (p1 = pHead2)
            (p2 != nil) ? (p2 = p2?.next) : (p2 = pHead1)
        }
        return p1
    }
    
    //链表中倒数最后k个结点
    //https://www.nowcoder.com/practice/886370fe658f41b498d40fb34ae76ff9?tpId=295&tqId=1377477&ru=/exam/oj&qru=/ta/format-top101/question-ranking&sourceUrl=%2Fexam%2Foj
    func FindKthToTail ( _ pHead: ListNode?,  _ k: Int) -> ListNode? {
        // write code here
        if k == 0 || pHead == nil {
            return nil
        }
        var mListNode = pHead
        var m = 1
        while(m <= k && mListNode != nil) {
            mListNode = mListNode?.next
            m += 1
        }
        if mListNode == nil && (m < k+1) {
            return nil
        }
        var nListNode = pHead
        while(mListNode != nil) {
            mListNode = mListNode?.next
            nListNode = nListNode?.next
        }
        return nListNode
    }
    
    //BM7 链表中环的入口结点
    //https://www.nowcoder.com/practice/253d2c59ec3e4bc68da16833f79a38e4?tpId=295&tqId=23449&ru=%2Fpractice%2Ff95dcdafbde44b22a6d741baf71653f6&qru=%2Fta%2Fformat-top101%2Fquestion-ranking&sourceUrl=%2Fexam%2Foj
    func EntryNodeOfLoop ( _ pHead: ListNode?) -> ListNode? {
        // write code here
        if pHead == nil || pHead?.next == nil {
            return nil
        }
        var mHead = pHead //慢指针
        var nHead = pHead //快指针
        while(mHead != nil && nHead != nil && nHead?.next != nil) {
            mHead = mHead?.next
            nHead = nHead?.next?.next
            if mHead === nHead {
                break
            }
        }
        if !(mHead === nHead) {
            return nil
        } else {//mHead和nHead已经相遇
            var oHead = pHead
            while(mHead != nil && oHead != nil && !(mHead === oHead)) {
                mHead = mHead?.next
                oHead = oHead?.next
            }
            return oHead
        }
    }
    
    //BM9 删除链表的倒数第n个节点
    //https://www.nowcoder.com/practice/f95dcdafbde44b22a6d741baf71653f6?tpId=295&tqId=727&ru=/exam/oj&qru=/ta/format-top101/question-ranking&sourceUrl=%2Fexam%2Foj
    func removeNthFromEnd ( _ head: ListNode?,  _ n: Int) -> ListNode? {
        // write code here
        if n == 0 {
            return head
        }
        let pHead = ListNode.init(-1, nil)
        pHead.next = head
        var mNode = pHead
        var k = 0
        while(k<n && mNode.next != nil) {
            k += 1
            mNode = mNode.next!
        }
        if k < n {
            return nil
        }
        //找到倒数第k个节点的前一个
        var nNode = pHead
        while(mNode.next != nil) {
            nNode = nNode.next!
            mNode = mNode.next!
        }
        nNode.next = nNode.next!.next
        return pHead.next
    }
    
    //BM12 单链表的排序
    //https://www.nowcoder.com/practice/f23604257af94d939848729b1a5cda08?tpId=295&tqId=1008897&ru=/exam/oj&qru=/ta/format-top101/question-ranking&sourceUrl=%2Fexam%2Foj
    func sortInList ( _ head: ListNode?) -> ListNode? {
        // write code here
        if head == nil && head?.next == nil {
            return head
        }
        var array = [Int]()
        var curr = head
        while curr != nil {
            array.append(curr!.val)
            curr = curr?.next
        }
        array.sort { a, b in
            a < b
        }
        let putNodet = ListNode(-1,curr)
        while !array.isEmpty {
            putNodet.next = ListNode(array.popLast()!,putNodet.next)
        }
        return putNodet.next
    }
}

