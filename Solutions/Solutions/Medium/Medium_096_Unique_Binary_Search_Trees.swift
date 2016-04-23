/*

https://leetcode.com/problems/unique-binary-search-trees/

#96 Unique Binary Search Trees

Level: medium

Given n, how many structurally unique BST's (binary search trees) that store values 1...n?

For example,
Given n = 3, there are a total of 5 unique BST's.

1         3     3      2      1
 \       /     /      / \      \
  3     2     1      1   3      2
 /     /       \                 \
2     1         2                 3

Inspired by @liaison at https://leetcode.com/discuss/24282/dp-solution-in-6-lines-with-explanation-f-i-n-g-i-1-g-n-i

*/

import Foundation

class Medium_096_Unique_Binary_Search_Trees {
    // t=O(N^2), s=O(N)
    class func numTrees(n: Int) -> Int {
        var ret: [Int] = Array<Int>(count: n+1, repeatedValue: 0)
        ret[0] = 1
        ret[1] = 1
        if 2 <= n {
            for i in 2 ... n {
                for j in 0 ..< i {
                    ret[i] += ret[j] * ret[i-1-j]
                }
            }
        }
        return ret[n]
    }
}