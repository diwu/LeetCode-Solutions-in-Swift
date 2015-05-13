/*

https://leetcode.com/problems/valid-sudoku/

#36 Valid Sudoku 

Determine if a Sudoku is valid, according to: Sudoku Puzzles - The Rules.

"Each row must have the numbers 1-9 occuring just once."

"Each column must have the numbers 1-9 occuring just once."

"And the numbers 1-9 must occur just once in each of the 9 sub-boxes of the grid."

The Sudoku board could be partially filled, where empty cells are filled with the character '.'.

A partially filled sudoku which is valid.

Note:
A valid Sudoku board (partially filled) is not necessarily solvable. Only the filled cells need to be validated.

Inspired by @bigwolfandtiger at https://leetcode.com/discuss/17990/sharing-my-easy-understand-java-solution-using-set

*/

import Foundation

class Easy_036_Valid_Sudoku {
    class func isPartiallyValid(# board: [[Character]], x1: Int, y1: Int, x2: Int, y2: Int) -> Bool {
        var singleSet: Set<Character> = Set()
        for var i = x1; i <= x2; i++ {
            for var j = y1; j <= y2; j++ {
                if board[i][j] != "." {
                    if singleSet.contains(board[i][j]) == true {
                        return false
                    } else {
                        singleSet.insert(board[i][j])
                    }
                }
            }
        }
        return true
    }
    class func isValidSudoku(board: [[Character]]) -> Bool {
        for var i = 0; i < 9; i++ {
            if isPartiallyValid(board: board, x1: i, y1: 0, x2: i, y2: 8) == false {
                return false
            }
            if isPartiallyValid(board: board, x1: 0, y1: i, x2: 8, y2: i) == false {
                return false
            }
        }
        for var i = 0; i < 3; i++ {
            for var j = 0; j < 3; j++ {
                if isPartiallyValid(board: board, x1: i*3, y1: j*3, x2: i*3+2, y2: j*3+2) == false {
                    return false
                }
            }
        }
        return true
    }
}