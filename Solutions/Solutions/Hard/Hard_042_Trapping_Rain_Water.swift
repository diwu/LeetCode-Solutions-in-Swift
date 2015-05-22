/*

https://leetcode.com/problems/trapping-rain-water/

#Level: hard

#42 Trapping Rain Water

Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.

For example,
Given [0,1,0,2,1,0,1,3,2,1,2,1], return 6.

The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped. 

Inspired by @12344 at https://leetcode.com/discuss/3546/any-one-pass-solutions

*/

import Foundation

struct Hard_042_Trapping_Rain_Water {
    static func trap(nums: [Int]) -> Int {
        if count(nums) == 0 {
            return 0
        }
        var left = 0
        var right = count(nums) - 1
        var block = 0
        var all = 0
        var currLevel = 0
        while left <= right {
            if min(nums[left], nums[right]) > currLevel {
                all += (min(nums[left], nums[right]) - currLevel) * (right - left + 1)
                currLevel = min(nums[left], nums[right])
            }
            if nums[left] < nums[right] {
                block += nums[left++]
            } else {
                block += nums[right--]
            }
        }
        return all - block
    }
}
