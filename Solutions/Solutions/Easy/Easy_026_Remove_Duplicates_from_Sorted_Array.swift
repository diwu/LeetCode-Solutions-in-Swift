/*

https://leetcode.com/problems/remove-duplicates-from-sorted-array/

#26 Remove Duplicates from Sorted Array

Level: easy

Given a sorted array, remove the duplicates in place such that each element appear only once and return the new length.

Do not allocate extra space for another array, you must do this in place with constant memory.

For example,
Given input array nums = [1,1,2],

Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively. It doesn't matter what you leave beyond the new length.

Inspired by @liyangguang1988 at https://leetcode.com/discuss/10314/my-solution-time-o-n-space-o-1

*/

import Foundation

class Easy_026_Remove_Duplicates_from_Sorted_Array {
    // O (1) space, O(N) time
    class func removeDuplicates(inout arr: [Int]) -> Int {
        if arr.count < 2 {
            return arr.count
        }
        var index: Int = 1
        var n: Int = arr.count
        for var i: Int = 1; i < n; i++ {
            if arr[i] != arr[i-1] {
                arr[index++] = arr[i]
            }
        }
        return index
    }
}
