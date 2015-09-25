/*

https://leetcode.com/problems/remove-duplicates-from-sorted-list/

#83 Remove Duplicates from Sorted List

Level: easy

Given a sorted linked list, delete all duplicates such that each element appear only once.

For example,
Given 1->1->2, return 1->2.
Given 1->1->2->3->3, return 1->2->3.

Inspired by @Tao2014 at https://leetcode.com/discuss/7188/concise-solution-and-memory-freeing

*/

import Foundation

class Easy_083_Remove_Duplicates_From_Sorted_List {
    class Node {
        var value: Int
        var next: Node?
        init(value: Int, next: Node?) {
            self.value = value
            self.next = next
        }
    }
    class func deleteDuplicates(head: Node?) -> Node? {
        if head == nil {
            return nil
        }
        var curr: Node? = head
        while curr?.next != nil {
            if curr?.value == curr?.next?.value {
                curr?.next = curr?.next?.next
            } else {
                curr = curr?.next
            }
        }
        return head;
    }
}