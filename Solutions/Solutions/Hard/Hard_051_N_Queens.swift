/*

https://leetcode.com/problems/n-queens/

#51 N-Queens 

Level: hard

The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.

Given an integer n, return all distinct solutions to the n-queens puzzle.

Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space respectively.

For example,
There exist two distinct solutions to the 4-queens puzzle:

[
[".Q..",  // Solution 1
"...Q",
"Q...",
"..Q."],

["..Q.",  // Solution 2
"Q...",
"...Q",
".Q.."]
]

Inspired by @qqz003 at https://leetcode.com/discuss/22526/c-6ms-solution-use-bitmask

*/

import Foundation

struct Hard_051_N_Queens {
    private static func getNq(index: Int, n: Int) -> String {
        var charArr = [Character](repeating: ".", count: n)
        charArr[index] = "Q"
        return String(charArr)
    }
    private static func nQueens(n: Int, p: Int, l: Int, m: Int, r: Int, answer: inout [String], result: inout [[String]]) {
        if p >= n {
            result.append(answer)
            return
        }
        let mask = l | m | r
        var i = 0
        var b = 1
        while i < n {
            if mask & b == 0 {
                answer.append(getNq(index: i, n: n))
                nQueens(n: n, p: p+1, l: (l | b) >> 1, m: m | b, r: (r | b) << 1, answer: &answer, result: &result)
                answer.removeLast()
            }
            i += 1
            b <<= 1
        }
    }
    static func solveNQueens(_ n: Int) -> [[String]] {
        var result = [[String]]()
        var answer = [String]()
        nQueens(n: n, p: 0, l: 0, m: 0, r: 0, answer: &answer, result: &result)
        return result
    }
}
