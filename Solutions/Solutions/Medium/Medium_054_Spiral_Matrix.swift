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
    private static func validate(_ rBegin: Int, _ rEnd: Int, _ cBegin: Int, _ cEnd: Int) -> Bool {
        if rBegin > rEnd { return false }
        if cBegin > cEnd { return false }
        return true
    }
    static func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let m = matrix.count
        if m == 0 { return [] }
        let n = matrix[0].count
        if n == 0 { return [] } 
        var result = [Int]()
        var rBegin = 0, cBegin = 0
        var rEnd = m - 1
        var cEnd = n - 1
        while rBegin <= rEnd && cBegin <= cEnd {
            for i in cBegin ... cEnd { result.append(matrix[rBegin][i]) }
            rBegin += 1
            if validate(rBegin, rEnd, cBegin, cEnd) == true {
                for i in rBegin ... rEnd { result.append(matrix[i][cEnd]) }
            }
            cEnd -= 1
            if validate(rBegin, rEnd, cBegin, cEnd) == true {
                for i in (cBegin ... cEnd).reversed() { result.append(matrix[rEnd][i]) }
            }
            rEnd -= 1
            if validate(rBegin, rEnd, cBegin, cEnd) == true {
                for i in (rBegin ... rEnd).reversed() { result.append(matrix[i][cBegin]) }
            }
            cBegin += 1
        }
        return result
    }
}
