/*

https://leetcode.com/discuss/25580/simple-java-solution-with-clear-explanation

#92 Reverse Linked List II

Level: medium

Reverse a linked list from position m to n. Do it in-place and in one-pass.

For example:
Given 1->2->3->4->5->NULL, m = 2 and n = 4,

return 1->4->3->2->5->NULL.

Note:
Given m, n satisfy the following condition:
1 ≤ m ≤ n ≤ length of list.

Inspired by @ardyadipta at https://leetcode.com/discuss/25580/simple-java-solution-with-clear-explanation

*/

import Foundation

class Medium_092_Reverse_Linked_List_II {
    class Node {
        var value: Int
        var next: Node?
        init(value: Int, next: Node?) {
            self.value = value
            self.next = next
        }
    }
    // t = O(N), s = O(1), one pass
    class func reverseBetween(head: Node?, m: Int, n: Int) -> Node? {
        if head == nil {
            return nil
        }
        let dummy: Node = Node(value: 0, next: head)
        var pre: Node? = dummy
        for var i = 0; i < m - 1; i++ {
            pre = pre?.next
        }
        let start: Node? = pre?.next
        var then: Node? = start?.next
        for var i = 0; i < n - m; i++ {
            start?.next = then?.next
            then?.next = pre?.next
            pre?.next = then
            then = start?.next
        }
        return dummy.next
    }
}