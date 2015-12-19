/*

https://leetcode.com/problems/symmetric-tree/

#101 Symmetric Tree

Level: easy

Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).

For example, this binary tree is symmetric:

    1
   / \
  2   2
 / \ / \
3  4 4  3

But the following is not:

    1
   / \
  2   2
   \   \
   3    3

Inspired by [@xuanaux](https://leetcode.com/discuss/456/recusive-solution-symmetric-optimal-solution-inordertraversal)

*/

import Foundation

class Easy_101_Symmetric_Tree {
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
    class func isSymmetric(root: Node?) -> Bool {
        if root == nil {
            return true
        }
        var stack_1: [Node?] = []
        var stack_2: [Node?] = []
        stack_1.append(root)
        stack_2.append(root)
        while stack_1.isEmpty == false && stack_2.isEmpty == false {
            let tmp_1: Node? = stack_1.popLast()!
            let tmp_2: Node? = stack_2.popLast()!
            if tmp_1 == nil && tmp_2 == nil {
                continue
            }
            if tmp_1 == nil || tmp_2 == nil {
                return false
            }
            if tmp_1!.value != tmp_2!.value {
                return false
            }
            stack_1.append(tmp_1!.right)
            stack_2.append(tmp_2!.left)
            stack_1.append(tmp_1!.left)
            stack_2.append(tmp_2!.right)
        }
        return true
    }
}