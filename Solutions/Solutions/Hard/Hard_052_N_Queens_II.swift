/*

https://leetcode.com/problems/n-queens-ii/

#52 N-Queens II 

Follow up for N-Queens problem.

Now, instead outputting board configurations, return the total number of distinct solutions.

Inspired by @qiqjiao at https://leetcode.com/discuss/743/whats-your-solution

*/

import Foundation

struct Hard_052_N_Queens_II {
    private static func dfs(# h: Int, r: Int, l: Int, inout answer: Int, inout limit: Int) {
        if h == limit {
            answer++
            return
        }
        var position = limit & (~(h|r|l))
        while position > 0 {
            var p = position & (-position)
            position -= p
            dfs(h: h+p, r: (r+p)<<1, l: (l+p)>>1, answer: &answer, limit: &limit)
        }
    }
    static func totalNQueens(n: Int) -> Int {
        if n == 0 {
            return 0
        }
        var answer = 0
        var limit = (1<<n) - 1
        dfs(h: 0, r: 0, l: 0, answer: &answer, limit: &limit)
        return answer
    }
}