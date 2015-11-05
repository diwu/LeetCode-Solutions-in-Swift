/*

#94 Binary Tree Inorder Traversal

Given a binary tree, return the inorder traversal of its nodes' values.

For example:
Given binary tree {1,#,2,3},
1
 \
  2
 /
3
return [1,3,2].

Note: Recursive solution is trivial, could you do it iteratively?

Inspired by @lvlolitte at https://leetcode.com/discuss/19765/iterative-solution-in-java-simple-and-readable and @blue_y at https://leetcode.com/discuss/11295/morris-traversal-no-recursion-no-stack

*/

import Foundation

class Medium_094_Binary_Tree_Inorder_Traversal {
    class Node {
        var value: Int
        var left: Node?
        var right: Node?
        init(value: Int, left: Node?, right: Node?) {
            self.value = value
            self.left = left
            self.right = right
        }
        
    }
    class func inorderTraversal(root: Node?) -> [Int] {
        return inorderTraversal_morris(root)
    }
    class func inorderTraversal_morris(var root: Node?) -> [Int] {
        if root == nil {
            return []
        } else {
            var res: [Int] = []
            var pre: Node? = nil
            while root != nil {
                if root?.left == nil {
                    res.append((root?.value)!)
                    root = root?.right
                } else {
                    pre = root?.left
                    while pre?.right != nil && pre?.right! !== root {
                        pre = pre?.right
                    }
                    if pre?.right == nil {
                        pre?.right = root
                        root = root?.left
                    } else {
                        pre?.right = nil
                        res.append((root?.value)!)
                        root = root?.right
                    }
                }
            }
            return res
        }
    }
    // Iteration, t = O(N), s = O(N)
    class func inorderTraversal_iteration(root: Node?) -> [Int] {
        var res: [Int] = []
        var stack: [Node] = []
        var curr: Node? = root
        while curr != nil || stack.isEmpty == false {
            while let unwrapped = curr {
                stack.append(unwrapped)
                curr = curr?.left
            }
            let last: Node = stack.removeLast()
            res.append(last.value)
            curr = last.right
        }
        return res
    }
    class func inorderTraversal_recursion_helper(root root: Node?, inout arr: [Int]) {
        if let unwrapped = root {
            inorderTraversal_recursion_helper(root: unwrapped.left, arr: &arr)
            arr.append(unwrapped.value)
            inorderTraversal_recursion_helper(root: unwrapped.right, arr: &arr)
        } else {
            return
        }
    }
    // Recursion, t = O(N), s = O(N)
    class func inorderTraversal_recursion(root: Node?) -> [Int] {
        var res: [Int] = []
        inorderTraversal_recursion_helper(root: root, arr: &res)
        return res
    }
    
}