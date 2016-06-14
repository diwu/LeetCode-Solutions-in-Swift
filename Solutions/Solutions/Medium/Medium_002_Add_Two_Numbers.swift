/*

https://oj.leetcode.com/problems/add-two-numbers/

#2 Add Two Numbers

Level: medium

You are given two linked lists representing two non-negative numbers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8

Inspired by @potpie at https://oj.leetcode.com/discuss/2308/is-this-algorithm-optimal-or-what

*/

class Medium_002_Add_Two_Numbers {
    // Linked List Data Structure
    class ListNode {
        var value: Int
        var next: ListNode?
        init () {
            value = 0
            next = nil
        }
        init (nodeValue: Int, nodeNext: ListNode?) {
            value = nodeValue
            next = nodeNext
        }
    }

    // t = O(N), s = O(1)
    static func addNumbers(_ node1: ListNode?, node2: ListNode?) -> ListNode? {
        var tmp1: ListNode? = node1
        var tmp2: ListNode? = node2
        let dummy: ListNode = ListNode()
        var curr: ListNode = dummy
        var sum: Int = 0

        while tmp1 != nil || tmp2 != nil {
            sum /= 10
            if let n = tmp1 {
                sum += n.value
                tmp1 = n.next
            }
            if let n = tmp2 {
                sum += n.value
                tmp2 = n.next
            }
            curr.next = ListNode(nodeValue: sum%10, nodeNext: nil)
            if let n = curr.next {
                curr = n
            }
        }

        if sum / 10 == 1 {
            curr.next = ListNode(nodeValue: 1, nodeNext: nil)
        }
        
        return dummy.next
    }
}
