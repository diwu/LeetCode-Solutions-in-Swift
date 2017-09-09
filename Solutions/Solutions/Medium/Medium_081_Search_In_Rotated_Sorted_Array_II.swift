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
    static func search(nums: [Int], target: Int) -> Bool {
        guard nums.count > 0 else { return false }
        var lo = 0, hi = nums.count - 1
        while lo < hi {
            let mid = (lo + hi)/2
            if nums[mid] == target { return true }
            if nums[lo] < nums[mid] {
                if target < nums[mid] && target >= nums[lo] { hi = mid - 1 }
                else { lo = mid + 1 }
            } else if nums[lo] > nums[mid] {
                if target > nums[mid] && target <= nums[hi] { lo = mid + 1 }
                else { hi = mid - 1 }
            } else { lo += 1 }
        }
        return nums[lo] == target
    }
                
}
