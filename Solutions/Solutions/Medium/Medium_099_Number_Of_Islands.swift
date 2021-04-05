/*
https://leetcode.com/problems/number-of-islands/
#99 Number Of Islands
Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
*/
import UIKit
class Medium_099_Number_Of_Islands{
func numIslands(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 else { return 0 }
    guard grid[0].count > 0 else { return 0 }
    var grid = grid
    var islandCounter = 0
    for i in 0..<grid.count{
        for j in 0..<grid[i].count{
            if grid[i][j] == "1"{
                islandCounter += 1
                LandSink(&grid, i, j)
            }
        }
    }
    return islandCounter
}
func LandSink(_ grid : inout [[Character]], _ i : Int, _ j : Int){
    if i >= 0 && j >= 0 && i < grid.count && j < grid[i].count && grid[i][j] == "1" {
        grid[i][j] = "0"
        LandSink(&grid, i+1, j)
        LandSink(&grid, i-1, j)
        LandSink(&grid, i, j+1)
        LandSink(&grid, i, j-1)
    }
    else{
        return
    }
}
}
