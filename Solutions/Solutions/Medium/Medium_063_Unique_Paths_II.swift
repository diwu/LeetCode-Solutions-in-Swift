/*

https://leetcode.com/problems/unique-paths-ii/

#63 Unique Paths II

Level: medium

Follow up for "Unique Paths":

Now consider if some obstacles are added to the grids. How many unique paths would there be?

An obstacle and empty space is marked as 1 and 0 respectively in the grid.

For example,
There is one obstacle in the middle of a 3x3 grid as illustrated below.

[
[0,0,0],
[0,1,0],
[0,0,0]
]
The total number of unique paths is 2.

Note: m and n will be at most 100.

Inspired by @vvelrath@buffalo.edu at https://leetcode.com/discuss/15756/java-solution-using-dynamic-programming-o-1-space

*/

import Foundation

struct Medium_063_Unique_Paths_II {
    static func uniquePathsWithObstacles(_ og: [[Int]]) -> Int {
        var obstacleGrid = og
        if obstacleGrid.count == 0 {
            return 0
        }
        let rows = obstacleGrid.count
        let cols = obstacleGrid[0].count
        
        for i in 0 ..< rows {
            for j in 0 ..< cols {
                if obstacleGrid[i][j] == 1 {
                    obstacleGrid[i][j] = 0
                } else if i == 0 && j == 0 {
                    obstacleGrid[i][j] = 1
                } else if i == 0 {
                    obstacleGrid[i][j] = obstacleGrid[i][j-1] * 1
                } else if j == 0 {
                    obstacleGrid[i][j] = obstacleGrid[i-1][j] * 1
                } else {
                    obstacleGrid[i][j] = obstacleGrid[i-1][j] + obstacleGrid[i][j-1]
                }
            }
        }
        
        return obstacleGrid[rows-1][cols-1];
    }
}
