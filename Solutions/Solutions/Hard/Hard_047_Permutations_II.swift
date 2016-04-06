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
    private static func reverseInPlace(inout nums  nums: [Int], begin bgn: Int, end ed: Int) {
        var begin = bgn
        var end = ed
        while begin < end {
            swap(&nums[begin], &nums[end]);
            begin += 1
            end -= 1
        }
    }
    static func permuteUnique(n: [Int]) -> [[Int]] {
        var nums = n
        var result = [[Int]]()
        nums.sortInPlace {$0 < $1}
        result.append(nums)
        while true {
            var i: Int = nums.count - 1
            for _ in (1 ..< nums.count).reverse() {
                if nums[i-1] < nums[i] {
                    break
                }
                i -= 1
            }
            if i == 0 {
                break
            }
            var j: Int = nums.count - 1
            for _ in (i ..< nums.count).reverse() {
                if nums[j] > nums[i-1] {
                    break
                }
                j -= 1
            }
            swap(&nums[i-1], &nums[j])
            reverseInPlace(nums: &nums, begin: i, end: nums.count-1)
            result.append(nums)
        }
        return result
    }
}