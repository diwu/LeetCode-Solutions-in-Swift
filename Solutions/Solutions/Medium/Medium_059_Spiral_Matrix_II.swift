/*

https://leetcode.com/problems/spiral-matrix-ii/

#59 Spiral Matrix II

Level: medium

Given an integer n, generate a square matrix filled with elements from 1 to n2 in spiral order.

For example,
Given n = 3,

You should return the following matrix:
[
[ 1, 2, 3 ],
[ 8, 9, 4 ],
[ 7, 6, 5 ]
]

Inspired by @yike at https://leetcode.com/discuss/21677/simple-c-solution-with-explaination

*/

import Foundation

struct Medium_059_Spiral_Matrix_II {
    static func generateMatrix(n: Int) -> [[Int]] {
        var res = Array<[Int]>(count: n, repeatedValue: Array<Int>(count: n, repeatedValue: 0))
        var k = 1
        var i = 0
        while k <= n * n {
            var j = i
            while j < n - i {
                res[i][j++] = k++
            }
            j = i + 1
            while j < n - i {
                res[j++][n-i-1] = k++
            }
            j = n - i - 2
            while j > i {
                res[n-i-1][j--] = k++
            }
            j = n - i - 1
            while j > i {
                res[j--][i] = k++
            }
            i++
        }
        return res
    }
}