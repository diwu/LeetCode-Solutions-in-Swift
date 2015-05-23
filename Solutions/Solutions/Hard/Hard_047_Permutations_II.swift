/*

https://leetcode.com/problems/permutations-ii/

#47 Permutations II 

Level: hard

Given a collection of numbers that might contain duplicates, return all possible unique permutations.

For example,
[1,1,2] have the following unique permutations:
[1,1,2], [1,2,1], and [2,1,1].

Inspired by @TransMatrix at https://leetcode.com/discuss/10609/a-non-recursive-c-implementation-with-o-1-space-cost

*/

import Foundation

struct Hard_047_Permutations_II {
    private static func reverseInPlace(inout # nums: [Int], var begin: Int, var end: Int) {
        while begin < end {
            swap(&nums[begin++], &nums[end--]);
        }
    }
    static func permuteUnique(var nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        nums.sort{$0 < $1}
        result.append(nums)
        while true {
            var i: Int
            for i = count(nums) - 1; i > 0; i-- {
                if nums[i-1] < nums[i] {
                    break
                }
            }
            if i == 0 {
                break
            }
            var j: Int
            for j = count(nums) - 1; j > i - 1; j-- {
                if nums[j] > nums[i-1] {
                    break
                }
            }
            swap(&nums[i-1], &nums[j])
            reverseInPlace(nums: &nums, begin: i, end: count(nums)-1)
            result.append(nums)
        }
        return result
    }
}