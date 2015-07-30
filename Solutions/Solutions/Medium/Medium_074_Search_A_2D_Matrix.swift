/*

https://leetcode.com/problems/search-a-2d-matrix/

#74 Search a 2D Matrix

Level: medium

Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:

Integers in each row are sorted from left to right.
The first integer of each row is greater than the last integer of the previous row.
For example,

Consider the following matrix:

[
[1,   3,  5,  7],
[10, 11, 16, 20],
[23, 30, 34, 50]
]
Given target = 3, return true.

Inspired by @vaputa at https://leetcode.com/discuss/10735/dont-treat-it-as-a-2d-matrix-just-treat-it-as-a-sorted-list

*/

import Foundation

struct Medium_074_Search_A_2D_Matrix {
    static func searchMatrix(matrix matrix: [[Int]], target: Int) -> Bool {
        let n = matrix.count
        let m = matrix[0].count
        var l = 0
        var r = m * n - 1
        while l != r {
            let mid = (l + r - 1) >> 1
            if matrix[mid/m][mid%m] < target {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return matrix[r/m][r%m] == target
    }
}