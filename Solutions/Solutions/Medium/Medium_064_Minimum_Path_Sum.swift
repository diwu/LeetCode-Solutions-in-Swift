/*

https://leetcode.com/problems/minimum-path-sum/

#64 Minimum Path Sum

Level: medium

Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

Note: You can only move either down or right at any point in time.

Inspired by @wdj0xda at https://leetcode.com/discuss/17111/my-java-solution-using-dp-and-no-extra-space

*/

import Foundation

struct Medium_064_Minimum_Path_Sum {
    static func minPathSum(var grid: [[Int]]) -> Int {
        if grid.count == 0 {
            return 0
        }
        let rows = grid.count
        let cols = grid[0].count
        
        for var i = 0; i < rows; i++ {
            for var j = 0; j < cols; j++ {
                if i == 0 && j != 0 {
                    grid[i][j] = grid[i][j] + grid[i][j-1]
                } else if i != 0 && j == 0 {
                    grid[i][j] = grid[i-1][j] + grid[i][j]
                } else if i != 0 && j != 0 {
                    grid[i][j] = min(grid[i-1][j], grid[i][j-1]) + grid[i][j]
                }
            }
        }
        
        return grid[rows-1][cols-1]
    }
}