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
    private static func permuteRecursive(var nums  nums: [Int], begin: Int, inout result: [[Int]]) {
        if begin >= nums.count {
            result.append(nums)
            return
        }
        for var i = begin; i < nums.count; i++ {
            swap(&nums[begin], &nums[i])
            permuteRecursive(nums: nums, begin: begin + 1, result: &result)
            swap(&nums[begin], &nums[i])
        }
    }
    static func permute(nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        permuteRecursive(nums: nums, begin: 0, result: &result)
        return result
    }
}