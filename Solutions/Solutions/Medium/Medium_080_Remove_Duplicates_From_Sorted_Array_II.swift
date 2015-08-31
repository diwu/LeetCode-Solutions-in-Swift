/*

https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/

#80 Remove Duplicates from Sorted Array II

Level: medium

Follow up for "Remove Duplicates":
What if duplicates are allowed at most twice?

For example,
Given sorted array nums = [1,1,1,2,2,3],

Your function should return length = 5, with the first five elements of nums being 1, 1, 2, 2 and 3. It doesn't matter what you leave beyond the new length.

Inspired by @dragonmigo at https://leetcode.com/discuss/2754/is-it-possible-to-solve-this-question-in-place

*/

import Foundation

struct Medium_080_Remove_Duplicates_From_Sorted_Array_II {
    static func removeDuplicates(inout nums: [Int]) {
        if nums.count <= 2 {
            return
        }
        var len = 2
        var iterator = 2
        while iterator < nums.count {
            if nums[iterator] != nums[len-2] {
                nums[len++] = nums[iterator]
            }
            iterator++
        }
    }
}