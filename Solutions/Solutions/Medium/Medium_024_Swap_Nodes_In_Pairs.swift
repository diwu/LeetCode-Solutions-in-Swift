/*

https://leetcode.com/problems/swap-nodes-in-pairs/

#24 Swap Nodes in Pairs

Level: medium

Given a linked list, swap every two adjacent nodes and return its head.

For example,
Given 1->2->3->4, you should return the list as 2->1->4->3.

Your algorithm should use only constant space. You may not modify the values in the list, only nodes itself can be changed.

Inspired by @mike3 at https://leetcode.com/discuss/3608/seeking-for-a-better-solution

*/

import Foundation

class Medium_024_Swap_Nodes_In_Pairs {
    class Node {
        var value: Int
        var next: Node?
        init(value: Int, next: Node?) {
            self.value = value
            self.next = next
        }
    }
    class func swap(next1  next1: Node, next2: Node) -> Node {
        next1.next = next2.next
        next2.next = next1
        return next2
    }
    class func swapPairs(head: Node?) -> Node? {
        let dummy: Node = Node(value: 0, next: nil)
        dummy.next = head
        for var curr: Node? = dummy; curr?.next != nil && curr?.next?.next != nil; curr = curr?.next?.next {
            curr?.next = swap(next1: curr!.next!, next2: curr!.next!.next!)
        }
        return dummy.next
    }
}