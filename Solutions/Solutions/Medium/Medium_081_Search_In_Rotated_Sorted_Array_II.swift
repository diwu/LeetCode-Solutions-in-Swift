/*

https://leetcode.com/problems/search-in-rotated-sorted-array-ii/

#81 Search in Rotated Sorted Array II 

Level: medium

Follow up for "Search in Rotated Sorted Array"(#33):
What if duplicates are allowed?

Would this affect the run-time complexity? How and why?

Write a function to determine if a given target is in the array.

Inspired by @1337c0d3r at https://leetcode.com/discuss/223/when-there-are-duplicates-the-worst-case-is-could-we-do-better

*/

import Foundation

struct Medium_081_Search_In_Rotated_Sorted_Array_II {
    static func search(nums nums: [Int], target: Int) -> Bool {
        var l = 0, r = nums.count - 1
        while l <= r {
            let m = l + (r - l)/2
            if nums[m] == target {
                return true
            }
            if nums[l] < nums[m] {  // left half is sorted
                if nums[l] <= target && target < nums[m] {
                    r = m - 1
                } else {
                    l = m + 1
                }
            } else if nums[l] > nums[m] {
                if nums[m] < target && target <= nums[r] {
                    l = m + 1
                } else {
                    r = m - 1
                }
            } else {
                l += 1
            }
        }
        return false
    }
}