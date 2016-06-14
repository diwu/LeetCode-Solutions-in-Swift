/*

https://leetcode.com/problems/set-matrix-zeroes/

#73 Set Matrix Zeroes

Given a m x n matrix, if an element is 0, set its entire row and column to 0. Do it in place.

Follow up:
Did you use extra space?
A straight forward solution using O(mn) space is probably a bad idea.
A simple improvement uses O(m + n) space, but still not the best solution.
Could you devise a constant space solution?

Inspired by @mzchen at https://leetcode.com/discuss/15997/any-shortest-o-1-space-solution

*/

import Foundation

struct Medium_073_Set_Matrix_Zeroes {
    static func setZeros(_ matrix: inout [[Int]]) {
        var col0 = 1
        let rows = matrix.count
        let cols = matrix[0].count
        for i in 0 ..< rows {
            if matrix[i][0] == 0 {
                col0 = 0
            }
            for j in 1 ..< cols {
                if matrix[i][j] == 0 {
                    matrix[i][0] = 0
                    matrix[0][j] = 0
                }
            }
        }
        for i in (0...rows-1).reversed() {
            for j in (1...cols-1).reversed() {
                if matrix[i][0] == 0 || matrix[0][j] == 0 {
                    matrix[i][j] = 0
                }
            }
            if col0 == 0 {
                matrix[i][0] = 0
            }
        }
    }
}
