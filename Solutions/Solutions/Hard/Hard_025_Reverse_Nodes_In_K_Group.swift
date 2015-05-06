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

Inspired by @sean hyuntaek and @shpolsky at https://leetcode.com/discuss/6113/my-solution-accepted-in-java and https://leetcode.com/discuss/21301/short-but-recursive-java-code-with-comments

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
    // iteration， takes O(1) space
    class func reverseKGroup(var # head: Node?, k: Int) -> Node? {
        if head == nil {
            return nil
        }
        var dummy: Node = Node(value: 0, next: head)
        var prev: Node? = dummy
        var curr: Node? = head
        while curr != nil {
            var pilot: Node? = prev?.next
            var remaining: Int = k
            while pilot != nil && remaining > 0 {
                remaining--
                pilot = pilot?.next
            }
            if remaining > 0 {
                break
            }
            while curr?.next !== pilot {
                var tmp: Node? = curr?.next?.next
                curr?.next?.next = prev?.next
                prev?.next = curr?.next
                curr?.next = tmp
            }
            prev = curr
            curr = curr?.next
        }
        return dummy.next
    }
    /*
    // recursive, takes O (N) space
    class func reverseKGroup_recursive(var # head: Node?, k: Int) -> Node? {
        var curr: Node? = head
        var count: Int = 0
        while curr != nil && count != k {
            curr = curr?.next
            count++
        }
        if count == k {
            curr = reverseKGroup_recursive(head: curr, k: k)
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
    */
}
