/*

https://oj.leetcode.com/problems/add-two-numbers/

#2 Add Two Numbers

Level: medium

You are given two linked lists representing two non-negative numbers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8

Inspired by @potpie at https://oj.leetcode.com/discuss/2308/is-this-algorithm-optimal-or-what

*/

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

// Solution
// O (N)
func addNumbers(n1: ListNode?, n2: ListNode?) -> ListNode? {
    var tmp1: ListNode? = n1
    var tmp2: ListNode? = n2
    var dummy: ListNode = ListNode()
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

// Test Case
// 2 -> 4 -> 5
// 5 -> 6 -> 4
// Result:
// 7 -> 0 -> 0 -> 1
var dummy1: ListNode = ListNode()
var dummy2: ListNode = ListNode()

var tmp: ListNode? = ListNode(nodeValue: 2, nodeNext: nil)
dummy1.next = tmp
if let n = tmp {
    n.next = ListNode(nodeValue: 4, nodeNext: nil)
    tmp = n.next
}
if let n = tmp {
    n.next = ListNode(nodeValue: 5, nodeNext: nil)
    tmp = n.next
}
dummy1
tmp = ListNode(nodeValue: 5, nodeNext: nil)
dummy2.next = tmp
if let n = tmp {
    n.next = ListNode(nodeValue: 6, nodeNext: nil)
    tmp = n.next
}
if let n = tmp {
    n.next = ListNode(nodeValue: 4, nodeNext: nil)
    tmp = n.next
}
dummy2
var result = addNumbers(dummy1.next, dummy2.next)



