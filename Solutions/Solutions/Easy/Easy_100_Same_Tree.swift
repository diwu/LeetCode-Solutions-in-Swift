/* 

https://leetcode.com/problems/same-tree/

#100 Same Tree

Level: easy

Given two binary trees, write a function to check if they are equal or not.

Two binary trees are considered equal if they are structurally identical and the nodes have the same value.

Inspired by [@JohnWeiGitHub](https://leetcode.com/discuss/3470/seeking-for-better-solution) and [@scott](https://leetcode.com/discuss/22197/my-non-recursive-method)

*/

import Foundation

class Easy_100_Same_Tree {
    class Node {
        var left: Node?
        var right: Node?
        var value: Int
        init(value: Int, left: Node?, right: Node?) {
            self.value = value
            self.left = left
            self.right = right
        }
    }
    // t = O(N), average s = O(logN), worst s = O(N)
    private class func isSameTree_recursion(p: Node?, q: Node?) -> Bool {
        if p == nil || q == nil {
            return (p == nil && q == nil)
        } else {
            return p!.value == q!.value && isSameTree(p: p?.left, q: q?.left) && isSameTree(p: p?.right, q: q?.right)
        }
    }
    // t = O(N), average s = O(logN), worst s = O(N)
    private class func isSameTree_iteration(p: Node?, q: Node?) -> Bool {
        if p == nil || q == nil {
            return (p == nil && q == nil)
        }
        var stack_p: [Node] = []
        var stack_q: [Node] = []
        stack_p.append(p!)
        stack_q.append(q!)
        while stack_p.isEmpty == false && stack_q.isEmpty == false {
            let tmp_p: Node = stack_p.removeLast()
            let tmp_q: Node = stack_q.removeLast()
            if tmp_p.value != tmp_q.value {
                return false
            }
            if tmp_p.left != nil {
                stack_p.append(tmp_p.left!)
            }
            if tmp_q.left != nil {
                stack_q.append(tmp_q.left!)
            }
            if stack_p.count != stack_q.count {
                return false
            }
            if tmp_p.right != nil {
                stack_p.append(tmp_p.right!)
            }
            if tmp_q.right != nil {
                stack_q.append(tmp_q.right!)
            }
            if stack_p.count != stack_q.count {
                return false
            }
        }
        return stack_q.count == stack_q.count
    }
    class func isSameTree(p: Node?, q: Node?) -> Bool {
        return isSameTree_iteration(p: p, q: q)
    }
}
