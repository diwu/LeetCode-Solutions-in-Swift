/*

https://leetcode.com/problems/sudoku-solver/

#37 Sudoku Solver

Level: hard

Write a program to solve a Sudoku puzzle by filling the empty cells.

Empty cells are indicated by the character '.'.

You may assume that there will be only one unique solution.

Inspired by @power721 at https://leetcode.com/discuss/5958/afraid-cant-solve-problem-interview-because-someone-simplify

*/

import Foundation

class Hard_037_Sudoku_Solver {
    class func validate(board: inout [[Character]], x: Int, y: Int) -> Bool {
        let c: Character = board[x][y]
        for i in 0 ..< 9 {
            if y != i && board[x][i] == c {
                return false
            }
            if x != i && board[i][y] == c {
                return false
            }
        }
        let xx: Int = x / 3 * 3
        let yy: Int = y / 3 * 3
        for i in xx ..< xx + 3 {
            for j in yy ..< yy + 3 {
                if x != i && y != j && board[i][j] == c {
                    return false
                }
            }
        }
        return true
    }
    class func dfs(board: inout [[Character]], position: Int) -> Bool {
        let n = board.count
        if position == n * n {
            return true
        }
        let x: Int = position / n
        let y: Int = position % n
        if board[x][y] == "." {
            let arr: [Character] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
            for c in arr {
                board[x][y] = c
                if validate(board: &board, x: x, y: y) && dfs(board: &board, position: position + 1) {
                    return true
                }
                board[x][y] = "."
            }
        } else {
            if dfs(board: &board, position: position + 1) == true {
                return true
            }
        }
        return false
    }
    class func solveSudoku(_ board: inout [[Character]]) {
        dfs(board: &board, position: 0)
    }
}
