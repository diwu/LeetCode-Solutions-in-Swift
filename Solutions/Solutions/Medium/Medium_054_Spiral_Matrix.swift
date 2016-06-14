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
    static func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var res = [Int]()
        if matrix.count == 0 {
            return res
        }
        var rowBegin = 0
        var rowEnd = matrix.count - 1
        var colBegin = 0
        var colEnd = matrix[0].count - 1
        while rowBegin <= rowEnd && colBegin <= colEnd {
            //Traverse Right
            if colBegin <= colEnd {
                for i in colBegin...colEnd {
                    res.append(matrix[rowBegin][i])
                }
            }
            rowBegin += 1
            //Traverse Down
            if rowBegin <= rowEnd {
                for i in rowBegin...rowEnd {
                    res.append(matrix[i][colEnd])
                }
            }
            colEnd -= 1
            if rowBegin <= rowEnd {
                //Traverse Left
                if colBegin <= colEnd {
                    for i in (colBegin...colEnd).reversed() {
                        res.append(matrix[rowEnd][i])
                    }
                }
            }
            rowEnd -= 1
            if colBegin <= colEnd {
                //Traverse Up
                if rowBegin <= rowEnd {
                    for i in (rowBegin...rowEnd).reversed() {
                        res.append(matrix[i][colBegin])
                    }
                }
            }
            colBegin += 1
        }
        return res
    }
}
