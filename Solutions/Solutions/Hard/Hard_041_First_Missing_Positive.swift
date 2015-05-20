/*

https://leetcode.com/problems/first-missing-positive/

#41 First Missing Positive 

Level: hard

Given an unsorted integer array, find the first missing positive integer.

For example,
Given [1,2,0] return 3,
and [3,4,-1,1] return 2.

Your algorithm should run in O(n) time and uses constant space.

Inspired by @makuiyu at https://leetcode.com/discuss/24013/my-short-c-solution-o-1-space-and-o-n-time

*/

import Foundation

struct Hard_041_First_Missing_Positive {
    static func firstMissingPositive(var nums: [Int]) -> Int {
        for var i = 0; i < count(nums); i++ {
            while nums[i] > 0 && nums[i] <= count(nums) && nums[nums[i]-1] != nums[i] {
                swap(&nums[i], &nums[nums[i]-1])
            }
        }
        for var i = 0; i < count(nums); i++ {
            if(nums[i] != i+1) {
                return i + 1;
            }
        }
        return count(nums) + 1;
    }
}