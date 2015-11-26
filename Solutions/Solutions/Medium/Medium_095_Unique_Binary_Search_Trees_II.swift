/*

https://leetcode.com/problems/unique-binary-search-trees-ii/

#95 Unique Binary Search Trees II

Level: medium

Given n, generate all structurally unique BST's (binary search trees) that store values 1...n.

For example,
Given n = 3, your program should return all 5 unique BST's shown below.

1         3     3      2      1
 \       /     /      / \      \
  3     2     1      1   3      2
 /     /       \                 \
2     1         2                 3

Inspired by @Jayanta at https://leetcode.com/discuss/10254/a-simple-recursive-solution

*/

import Foundation

class Medium_095_Unique_Binary_Search_Trees_II {
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
    private class func genTrees (start start: Int, end: Int) -> [Node?] {
        var ret: [Node?] = []
        if start > end {
            ret.append(nil)
            return ret
        } else if start == end {
            ret.append(Node.init(value: 1, left: nil, right: nil))
            return ret
        }
        var left: [Node?] = []
        var right: [Node?] = []
        for var i = start; i <= end; i++ {
            left = genTrees(start: start, end: i - 1)
            right = genTrees(start: i + 1, end: end)
            for left_node in left {
                for right_node in right {
                    let root = Node.init(value: 1, left: left_node, right: right_node)
                    ret.append(root)
                }
            }
        }
        return ret
    }
    // t = O(n^(n-1)) a.k.a Catalan Number, s = I've no idea
    class func generateTrees(n: Int) -> [Node?] {
        return genTrees(start: 1, end: n)
    }
}