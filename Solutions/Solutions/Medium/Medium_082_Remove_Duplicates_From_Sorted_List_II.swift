/*

https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/

#82 Remove Duplicates from Sorted List II 

Level: medium

Given a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list.

For example,
Given 1->2->3->3->4->4->5, return 1->2->5.
Given 1->1->1->2->3, return 2->3.

Inspired by @snowfish at https://leetcode.com/discuss/12724/my-accepted-java-code

*/

import Foundation

class Medium_082_Remove_Duplicates_From_Sorted_List_II {
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
        let fakeHead = Node(value: 0, next: nil)
        fakeHead.next = head
        var prev: Node? = fakeHead
        var curr: Node? = head
        while curr != nil {
            while curr?.next != nil && curr?.value == curr?.next?.value {
                curr = curr?.next
            }
            if prev?.next === curr {
                prev = prev?.next
            } else {
                prev?.next = curr?.next
            }
            curr = curr?.next
        }
        return fakeHead.next
    }
}