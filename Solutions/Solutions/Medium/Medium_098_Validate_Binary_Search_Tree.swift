/*

https://leetcode.com/problems/validate-binary-search-tree/

#98 Validate Binary Search Tree

Given a binary tree, determine if it is a valid binary search tree (BST).

Assume a BST is defined as follows:

The left subtree of a node contains only nodes with keys less than the node's key. The right subtree of a node contains only nodes with keys greater than the node's key. Both the left and right subtrees must also be binary search trees.

Inspired by [@jakwings](https://leetcode.com/discuss/14886/order-traversal-please-rely-buggy-int_max-int_min-solutions)

*/

import Foundation

class Medium_098_Validate_Binary_Search_Tree {
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
    private class func isValidBSTRecursionHelper(curr: Node?, prev: inout Node?) -> Bool {
        if curr == nil {
            return true
        } else {
            if isValidBSTRecursionHelper(curr: curr?.left, prev: &prev) == false {
                return false
            }
            if prev != nil && prev?.value > curr?.value {
                return false
            }
            prev = curr
            return isValidBSTRecursionHelper(curr: curr?.right, prev: &prev)
        }
    }
    // t = O(N), average s = O(logN), worst s = O(N)
    class func isValidBST(_ root: Node?) -> Bool {
        var prev: Node? = nil
        return isValidBSTRecursionHelper(curr: root, prev: &prev)
    }
}
