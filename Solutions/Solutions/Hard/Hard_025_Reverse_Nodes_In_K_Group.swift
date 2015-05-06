/*

https://leetcode.com/problems/reverse-nodes-in-k-group/

#25 Reverse Nodes in k-Group

Level: hard

Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.

If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.

You may not alter the values in the nodes, only nodes itself may be changed.

Only constant memory is allowed.

For example,
Given this linked list: 1->2->3->4->5

For k = 2, you should return: 2->1->4->3->5

For k = 3, you should return: 3->2->1->4->5

Inspired by @shpolsky at https://leetcode.com/discuss/21301/short-but-recursive-java-code-with-comments

*/

import Foundation

class Hard_025_Reverse_Nodes_In_K_Group {
    class Node {
        var value: Int
        var next: Node?
        init(value: Int, next: Node?) {
            self.value = value
            self.next = next
        }
    }
    class func reverseKGroup(var # head: Node?, k: Int) -> Node? {
        var curr: Node? = head
        var count: Int = 0
        while curr != nil && count != k {
            curr = curr?.next
            count++
        }
        if count == k {
            curr = reverseKGroup(head: curr, k: k)
            while count-- > 0 {
                var tmp: Node? = head?.next
                head?.next = curr
                curr = head
                head = tmp
            }
            head = curr
        }
        return head
    }
}
