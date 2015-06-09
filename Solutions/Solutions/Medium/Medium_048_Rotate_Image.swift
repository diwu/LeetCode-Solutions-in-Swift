/*

https://leetcode.com/problems/rotate-image/

#48 Rotate Image 

Level: medium

You are given an n x n 2D matrix representing an image.

Rotate the image by 90 degrees (clockwise).

Follow up:
Could you do this in-place?

Inspired by @shichaotan at https://leetcode.com/discuss/20589/a-common-method-to-rotate-the-image

*/

import Foundation

struct Medium_048_Rotate_Image {
    private static func reverseInPlace<T>(inout nums  nums: [T]) {
        for var i = 0; i < nums.count/2; i++ {
            swap(&nums[i], &nums[nums.count-1-i])
        }
    }
    static func rotate(inout matrix: [[Int]]) {
        reverseInPlace(nums: &matrix)
        for var i = 0; i < matrix.count; i++ {
            for var j = i + 1; j < matrix[i].count; j++ {
                swap(&matrix[i][j], &matrix[j][i]);
            }
        }
    }
}