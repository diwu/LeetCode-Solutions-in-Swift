/*

https://leetcode.com/problems/search-for-a-range/

#34 Search for a Range 

Level: medium

Given a sorted array of integers, find the starting and ending position of a given target value.

Your algorithm's runtime complexity must be in the order of O(log n).

If the target is not found in the array, return [-1, -1].

For example,
Given [5, 7, 7, 8, 8, 10] and target value 8,
return [3, 4].

Inspired by @stellari at https://leetcode.com/discuss/18242/clean-iterative-solution-binary-searches-with-explanation

*/

import Foundation

class Medium_034_Search_For_A_Range {
    class func searchRange(# nums: [Int], target: Int) -> [Int] {
        var i: Int = 0
        var j: Int = count(nums) - 1
        var result: [Int] = Array<Int>(count: 2, repeatedValue: -1)
        while i < j {
            var mid: Int = (i+j)/2
            if nums[mid] < target {
                i = mid + 1
            } else {
                j = mid
            }
        }
        if nums[i] != target {
            return result
        } else {
            result[0] = i
        }
        j = count(nums) - 1
        while i < j {
            var mid: Int = (i+j)/2 + 1
            if nums[mid] > target {
                j = mid - 1
            } else {
                i = mid
            }
        }
        result[1] = j
        return result
    }
}