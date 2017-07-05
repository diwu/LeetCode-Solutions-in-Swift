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
    private static func reverseInPlace<T>(nums: inout [T]) {
        for i in 0 ..< nums.count/2 {
            nums.swapAt(i, nums.count-1-i)
        }
    }
    static func rotate(_ matrix: inout [[Int]]) {
        reverseInPlace(nums: &matrix)
        for i in 0 ..< matrix.count {
            for j in i + 1 ..< matrix[i].count {
                let tmp0 = matrix[i][j]
                let tmp1 = matrix[j][i]
                matrix[i][j] = tmp1
                matrix[j][i] = tmp0
            }
        }
    }
}
