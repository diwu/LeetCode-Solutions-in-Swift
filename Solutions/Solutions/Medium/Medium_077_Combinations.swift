/*

https://leetcode.com/problems/combinations/

#77 Combinations

Level: medium

Given two integers n and k, return all possible combinations of k numbers out of 1 ... n.

For example,
If n = 4 and k = 2, a solution is:

[
[2,4],
[3,4],
[2,3],
[1,2],
[1,3],
[1,4],
]

Inspired by @reeclapple at https://leetcode.com/discuss/5913/whats-the-best-solution and @nangao at https://leetcode.com/discuss/12915/my-shortest-c-solution-using-dfs

*/

import Foundation

struct Medium_077_Combinations {
    static func combine(n n: Int, k: Int) -> [[Int]] {
        var queue: [[Int]] = []
        var summary: [[Int]] = []
        for var i = 1; i <= n; i++ {
            var list: [Int] = []
            list.append(i)
            queue.append(list)
        }
        while queue.isEmpty == false {
            let list = queue.removeFirst()
            if list.count == k {
                summary.append(list)
            } else {
                for var i = list.last! + 1; i <= n; i++ {
                    var nextList: [Int] = [Int](list)
                    nextList.append(i)
                    queue.append(nextList)
                }
            }
        }
        return summary
    }
    static func combine_recursion_helper(inout res res: [[Int]], inout tmp: [Int], start: Int, num: Int, n: Int, k: Int) {
        if num == k {
            res.append(tmp)
            return
        }
        for var i = start; i < n; i++ {
            tmp.append(i + 1)
            combine_recursion_helper(res: &res, tmp: &tmp, start: i+1, num: num+1, n: n, k: k)
            tmp.popLast()
        }
    }
    static func combine_recursion(n n: Int, k: Int) -> [[Int]] {
        var res: [[Int]] = []
        if n < k {
            return res
        }
        var tmp: [Int] = []
        combine_recursion_helper(res: &res, tmp: &tmp, start: 0, num: 0, n: n, k: k)
        return res
    }
}