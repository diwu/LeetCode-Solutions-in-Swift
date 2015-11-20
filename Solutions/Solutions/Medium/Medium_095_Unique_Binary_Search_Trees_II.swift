//
//  Medium_095_Unique_Binary_Search_Trees_II.swift
//  Solutions
//
//  Created by Di Wu on 11/20/15.
//  Copyright © 2015 diwu. All rights reserved.
//

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
    class func generateTrees(n: Int) -> [Node?] {
        return genTrees(start: 1, end: n)
    }
}