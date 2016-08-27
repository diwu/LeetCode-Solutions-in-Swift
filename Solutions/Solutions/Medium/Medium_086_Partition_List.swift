/*

https://leetcode.com/problems/partition-list/

#86 Partition List

Level: medium

Given a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.

You should preserve the original relative order of the nodes in each of the two partitions.

For example,
Given 1->4->3->2->5->2 and x = 3,
return 1->2->2->4->3->5.

Inspired by @shichaotan at https://leetcode.com/discuss/21032/very-concise-one-pass-solution

*/

import Foundation

class Medium_086_Partition_List {
    class Node {
        var value: Int
        var next: Node?
        init(value: Int, next: Node?) {
            self.value = value
            self.next = next
        }
    }
    class func partition(head h: Node?, x: Int) -> Node? {
        var head = h
        let sentinelA: Node? = Node(value: 0, next: nil)
        let sentinelB: Node? = Node(value: 0, next: nil)
        var pA: Node? = sentinelA
        var pB: Node? = sentinelB
        while head != nil {
            if (head?.value)! < x {
                pA?.next = head
                pA = pA?.next
            } else {
                pB?.next = head
                pB = pB?.next
            }
            head = head?.next
        }
        pB?.next = nil
        pA?.next = sentinelB?.next
        return sentinelA?.next
    }
}
