//
//  main.swift
//  ListNodeDemo
//
//  Created by ChengHao on 2022/2/25.
//

import Foundation

print("Hello, World!")

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int = 0, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

public class Solution {
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
    
}
