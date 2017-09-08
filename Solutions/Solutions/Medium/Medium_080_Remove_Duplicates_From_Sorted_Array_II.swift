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
    static func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var curr = 0, count = 0, prev = Int.min
        for i in 0..<nums.count {
            let tmp = nums[i]
            if tmp != prev || count < 2 {
                count = (tmp != prev) ? 1 : 2
                nums[curr] = tmp
                curr += 1
                prev = tmp
            } else { continue }
        }
        return curr
    }
}
