/*

https://leetcode.com/problems/subsets/

#78 Subsets

Level: medium

Given a set of distinct integers, nums, return all possible subsets.

Note:
Elements in a subset must be in non-descending order.
The solution set must not contain duplicate subsets.
For example,
If nums = [1,2,3], a solution is:

[
[3],
[1],
[2],
[1,2,3],
[1,3],
[2,3],
[1,2],
[]
]

Inspired by @thumike at https://leetcode.com/discuss/9213/my-solution-using-bit-manipulation

*/

import Foundation

struct Medium_078_Subsets {
    static func subsets(_ n: [Int]) -> [[Int]] {
        var nums = n
        nums.sort {$0 < $1}
        let elemNum = nums.count
        let subsetNum = Int(pow(2.0, Double(elemNum)))
        var subsets: [[Int]] = [[Int]](repeating: [], count: subsetNum)
        for i in 0..<elemNum {
            for j in 0..<subsetNum {
                if ((j >> i) & 1) != 0 {
                    subsets[j].append(nums[i])
                }
            }
        }
        return subsets
    }
}
