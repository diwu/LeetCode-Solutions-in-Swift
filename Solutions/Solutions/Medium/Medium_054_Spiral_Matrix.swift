/*

https://leetcode.com/problems/spiral-matrix/

#54 Spiral Matrix

Level: medium

Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.

For example,
Given the following matrix:

[
[ 1, 2, 3 ],
[ 4, 5, 6 ],
[ 7, 8, 9 ]
]
You should return [1,2,3,6,9,8,7,4,5].

Inspired by @qwl5004 at https://leetcode.com/discuss/12228/super-simple-and-easy-to-understand-solution

*/

import Foundation

struct Medium_054_Spiral_Matrix {
    static func spiralOrder(matrix: [[Int]]) -> [Int] {
        var res = [Int]()
        if count(matrix) == 0 {
            return res
        }
        var rowBegin = 0
        var rowEnd = count(matrix) - 1
        var colBegin = 0
        var colEnd = count(matrix[0]) - 1
        while rowBegin <= rowEnd && colBegin <= colEnd {
            //Traverse Right
            for var i = colBegin; i <= colEnd; i++ {
                res.append(matrix[rowBegin][i])
            }
            rowBegin++
            //Traverse Down
            for var i = rowBegin; i <= rowEnd; i++ {
                res.append(matrix[i][colEnd])
            }
            colEnd--
            if rowBegin <= rowEnd {
                //Traverse Left
                for var i = colEnd; i >= colBegin; i-- {
                    res.append(matrix[rowEnd][i])
                }
            }
            rowEnd--
            if colBegin <= colEnd {
                //Traverse Up
                for var i = rowEnd; i >= rowBegin; i-- {
                    res.append(matrix[i][colBegin])
                }
            }
            colBegin++
        }
        return res
    }
}
