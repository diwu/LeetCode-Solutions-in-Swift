/*

https://leetcode.com/problems/search-insert-position/

#35 Search Insert Position

Level: medium

Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

You may assume no duplicates in the array.

Here are few examples.
[1,3,5,6], 5 → 2
[1,3,5,6], 2 → 1
[1,3,5,6], 7 → 4
[1,3,5,6], 0 → 0

Inspired by @ouchxp at https://leetcode.com/discuss/8869/simple-binary-search-solution

*/

import Foundation

class Medium_035_Search_Insert_Position {
    class func searchInsert(nums  nums: [Int], target: Int) -> Int {
        var low: Int = 0
        var high: Int = nums.count - 1
        while low <= high {
            let mid: Int = low + (high - low)/2
            if target < nums[mid] {
                high = mid - 1
            } else if target > nums[mid] {
                low = mid + 1
            } else {
                return mid
            }
        }
        return low
    }
}