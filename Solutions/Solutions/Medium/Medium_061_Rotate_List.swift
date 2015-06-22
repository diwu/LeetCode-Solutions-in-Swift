/*

https://leetcode.com/problems/rotate-list/

#62 Rotate List

Level: medium

Given a list, rotate the list to the right by k places, where k is non-negative.

For example:
Given 1->2->3->4->5->NULL and k = 2,
return 4->5->1->2->3->NULL.

Inspired by @reeclapple at https://leetcode.com/discuss/9533/share-my-java-solution-with-explanation

*/

import Foundation

class Medium_061_Rotate_List {
    class Node {
        var value: Int
        var next: Node?
        init(value: Int, next: Node?) {
            self.value = value
            self.next = next
        }
    }
    class func rotateRight(head head: Node?, k: Int) -> Node? {
        if head == nil || head?.next == nil {
            return head;
        }
        let dummy: Node = Node(value: 0, next: nil)
        dummy.next = head
        var fast: Node? = dummy
        var slow: Node? = dummy
        var i: Int
        for i = 0; fast?.next != nil; i++ {
            fast = fast?.next
        }
        for var j = i - k % i; j > 0; j-- {
            slow = slow?.next
        }
        fast?.next = dummy.next
        dummy.next = slow?.next
        slow?.next = nil
        return dummy.next
    }
}
