/*

https://leetcode.com/problems/merge-k-sorted-lists/

#23 Merge k Sorted Lists 

Level: hard

Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.

Inspired by @wksora at https://leetcode.com/discuss/9279/a-java-solution-based-on-priority-queue

*/

import Foundation

class Hard_023_Merge_K_Sorted_Lists {
    class Node {
        var value: Int
        var next: Node?
        init(value: Int, next: Node?) {
            self.value = value
            self.next = next
        }
    }
    class func mergeTwoLists(var # l1: Node?, var l2: Node?) -> Node? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        var head: Node? = nil
        var prev: Node? = nil
        while l1 != nil && l2 != nil {
            if l1!.value > l2!.value {
                if prev == nil {
                    prev = l2
                } else {
                    prev!.next = l2
                }
                if head == nil {
                    head = prev
                } else {
                    prev = prev!.next
                }
                l2 = l2!.next
            } else {
                if prev == nil {
                    prev = l1
                } else {
                    prev!.next = l1
                }
                if head == nil {
                    head = prev
                } else {
                    prev = prev!.next
                }
                l1 = l1!.next
            }
        }
        if l2 != nil {
            l1 = l2
        }
        prev!.next = l1
        return head
    }
    class func mergeKLists(lists: [Node?]) -> Node? {
        if lists.count == 0 {
            return nil
        } else if lists.count == 1 {
            return lists[0]
        } else if lists.count == 2 {
            return mergeTwoLists(l1: lists[0], l2: lists[1])
        } else {
            return mergeTwoLists(l1: mergeKLists(Array(lists[0..<lists.count/2])), l2: mergeKLists(Array(lists[lists.count/2..<lists.count])))
        }
    }
}