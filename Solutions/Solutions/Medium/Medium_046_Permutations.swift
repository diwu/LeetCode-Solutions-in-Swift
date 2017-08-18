/*

https://leetcode.com/problems/permutations/

#46 Permutations

Level: medium

Given a collection of numbers, return all possible permutations.

For example,
[1,2,3] have the following permutations:
[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], and [3,2,1].

Inspired by @xiaohui7 at https://leetcode.com/discuss/18212/my-elegant-recursive-c-solution-with-inline-explanation

*/

import Foundation

struct Medium_046_Permutations {
    private static func permuteRecursive(nums n: [Int], begin: Int, result: inout [[Int]]) {
        var nums = n
        if begin >= nums.count {
            result.append(nums)
            return
        }
        for i in begin..<nums.count {
            nums.swapAt(i, begin)
            permuteRecursive(nums: nums, begin: begin + 1, result: &result)
            nums.swapAt(i, begin)
        }
    }
    static func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        permuteRecursive(nums: nums, begin: 0, result: &result)
        return result
    }
}
