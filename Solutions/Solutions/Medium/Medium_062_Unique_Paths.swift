/*

https://leetcode.com/problems/unique-paths/

#62 Unique Paths

Level: medium

A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

How many possible unique paths are there?

Inspired by @d40a at https://leetcode.com/discuss/9110/my-ac-solution-using-formula

*/

import Foundation

struct Medium_062_Unique_Paths {
    static func uniquePaths(m m: Int, n: Int) -> Int {
        let N = n + m - 2
        let k = min(m - 1, n - 1)
        var res = 1
        for i in 1 ... k {
            res = res * (N - k + i) / i;
        }
        return res;
    }
}