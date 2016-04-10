/*

https://github.com/diwu/LeetCode-Solutions-in-Swift

#19 Remove Nth Node From End of List 

Level: easy

Given a linked list, remove the nth node from the end of list and return its head.

For example,

Given linked list: 1->2->3->4->5, and n = 2.

After removing the second node from the end, the linked list becomes 1->2->3->5.

Note:

Given n will always be valid.
Try to do this in one pass.

Inspired by @i at https://leetcode.com/discuss/1656/is-there-a-solution-with-one-pass-and-o-1-space

*/

class Easy_019_Remove_Nth_Node_From_End_Of_List {

    class Node {
        var value: Int
        var next: Node?
        init(value: Int, next: Node?) {
            self.value = value
            self.next = next
        }
    }

    class func removeNthFromEnd(head: Node?, n: Int) -> Node? {
        let dummyHead: Node = Node(value: 0, next: head)
        var fast: Node? = dummyHead, slow: Node? = dummyHead
        var localN = n
        while localN > 0 {
            fast = fast?.next
            localN -= 1
        }
        while fast != nil && fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        slow?.next = slow?.next?.next
        return dummyHead.next
    }
}
