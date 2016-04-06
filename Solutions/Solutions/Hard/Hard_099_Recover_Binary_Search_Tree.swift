/*

https://leetcode.com/problems/recover-binary-search-tree/

#99 Recover Binary Search Tree

Two elements of a binary search tree (BST) are swapped by mistake.

Recover the tree without changing its structure.

Note: A solution using O(n) space is pretty straight forward. Could you devise a constant space solution?

Inspired by [@siyang3](https://leetcode.com/discuss/26310/detail-explain-about-morris-traversal-finds-incorrect-pointer)

*/

import Foundation

class Hard_099_Recover_Binary_Search_Tree {
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
    // Morris, t = O(N), both average & worst s = O(1)
    class func recoverTree(rt: Node?) -> Node? {
        var root = rt
        let origRoot: Node? = root
        var pre: Node? = nil
        var first: Node? = nil
        var second: Node? = nil
        var tmp: Node? = nil
        while root != nil {
            if root?.left != nil {
                tmp = root?.left
                while tmp?.right != nil && tmp?.right !== root {
                    tmp = tmp?.right
                }
                if tmp?.right != nil {
                    if pre != nil && pre?.value > root?.value {
                        if first == nil {
                            first = pre
                            second = root
                        } else {
                            second = root
                        }
                    }
                    pre = root
                    tmp?.right = nil
                    root = root?.right
                } else {
                    tmp?.right = root
                    root = root?.left
                }
            } else {
                if pre != nil && pre?.value > root?.value {
                    if first == nil {
                        first = pre
                        second = root
                    } else {
                        second = root
                    }
                }
                pre = root
                root = root?.right
            }
        }
        if first != nil && second != nil {
            let tmpValue: Int = first!.value
            first!.value = second!.value
            second!.value = tmpValue
        }
        return origRoot
    }
}