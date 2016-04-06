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
    private static func permuteRecursive(nums n: [Int], begin: Int, inout result: [[Int]]) {
        var nums = n
        if begin >= nums.count {
            result.append(nums)
            return
        }
        for i in begin..<nums.count {
            
            //FIXME: "Swap in place" causes runtime error!
            
            //This looks like a regresssion issue introduced in Xcode 7 Beta 6
            //Open Radar https://openradar.appspot.com/22440946
            //For now as a workaround we perform swap with an additional temporary variable
            
            //swap(&nums[begin], &nums[i])
            var tmp: Int = nums[begin];
            nums[begin] = nums[i];
            nums[i] = tmp
            
            permuteRecursive(nums: nums, begin: begin + 1, result: &result)
            
            //swap(&nums[begin], &nums[i])
            tmp = nums[begin];
            nums[begin] = nums[i];
            nums[i] = tmp
        }
    }
    static func permute(nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        permuteRecursive(nums: nums, begin: 0, result: &result)
        return result
    }
}