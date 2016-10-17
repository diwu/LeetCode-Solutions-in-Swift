/*
 
https://leetcode.com/problems/binary-tree-level-order-traversal/
 
#102 Binary Tree Level Order Traversal
 
Level: easy
 
Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
 
For example: Given binary tree [3,9,20,null,null,15,7],
      3
     / \
    9  20
   / \
 15   7
 return its level order traversal as:
 [
   [3],
   [9,20],
   [15,7]
 ]
 
Inspired by [@d40a](https://discuss.leetcode.com/topic/2399/it-is-my-ac-solution)
 
 */

import Foundation

class Easy_102_Binary_Tree_Level_Order_Traversal {
    class Node {
        var left: Node?
        var right: Node?
        var value: Int
        init(value v: Int, left l: Node?, right r: Node?) {
            self.value = v
            self.left = l
            self.right = r
        }
    }
    class func levelOrder(_ root: Node?) -> [[Int]] {
        guard let unwrappedRoot = root else {
            return []
        }
        var ret: [[Int]] = []
        var queue: [(Node, Int)] = [(unwrappedRoot, 0)]
        while let pair: (node: Node, index: Int) = queue.first {
            if ret.count <= pair.index {
                ret.append([Int]())
            }
            ret[pair.index].append(pair.node.value)
            if let l = pair.node.left {
                queue.append((l, pair.index + 1))
            }
            if let r = pair.node.right {
                queue.append((r, pair.index + 1))
            }
            _ = queue.removeFirst()
        }
        return ret
    }
}
