/*

https://leetcode.com/problems/word-search/

#79 Word Search

Level: medium

Given a 2D board and a word, find if the word exists in the grid.

The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.

For example,
Given board =

[
["ABCE"],
["SFCS"],
["ADEE"]
]
word = "ABCCED", -> returns true,
word = "SEE", -> returns true,
word = "ABCB", -> returns false.

Inspired by @pavel-shlyk at https://leetcode.com/discuss/23165/accepted-very-short-java-solution-no-additional-space

*/

import Foundation

struct Medium_079_Word_Search {
    static func exist(_ b: [[Character]], word: String) -> Bool {
        var board = b
        for x in 0..<board.count {
            for y in 0..<board[x].count {
                if exist_recursion_helper(board: &board, x: x, y: y, word: word, i: 0) {
                    return true
                }
            }
        }
        return false
    }
    static private func exist_recursion_helper(board: inout [[Character]], x: Int, y: Int, word: String, i: Int) -> Bool {
        if i == word.count {
            return true
        }
        if x < 0 || y < 0 || x == board.count || y == board[x].count {
            return false
        }
        let wArr = [Character](word)
        if board[x][y] != wArr[i] {
            return false
        }

        let tmp: Character = board[x][y]
        board[x][y] = "_"
        let exist: Bool = exist_recursion_helper(board: &board, x: x, y: y+1, word: word, i: i+1)
            || exist_recursion_helper(board: &board, x: x, y: y-1, word: word, i: i+1)
            || exist_recursion_helper(board: &board, x: x-1, y: y, word: word, i: i+1)
            || exist_recursion_helper(board: &board, x: x+1, y: y, word: word, i: i+1)
        board[x][y] = tmp
        return exist
    }
}
