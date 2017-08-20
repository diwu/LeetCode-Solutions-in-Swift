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
    static func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        for i in 0 ..< n/2 {
            matrix.swapAt(i, n-1-i)
        }
        for i in 0 ..< n {
            for j in i+1 ..< n {
                let tmp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = tmp
            }
        }
    }
}
