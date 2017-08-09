/*

https://leetcode.com/problems/generate-parentheses/

#22 Generate Parentheses 

Level: medium

Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

For example, given n = 3, a solution set is:

"((()))", "(()())", "(())()", "()(())", "()()()"

Inspired by @klyc0k at https://leetcode.com/discuss/14436/concise-recursive-c-solution

*/

import Foundation

struct Medium_022_Generate_Parentheses {
    static func helper(arr: inout [String], str: String, n: Int, m: Int) {
        if m == 0 && n == 0 {
            arr.append(str)
            return
        }
        if m > 0 {
            helper(arr: &arr, str: str + ")", n: n, m: m-1)
        }
        if n > 0 {
            helper(arr: &arr, str: str + "(", n: n-1, m: m+1)
        }
    }
    static func generateParenthesis(_ n: Int) -> [String] {
        var arr: [String] = []
        helper(arr: &arr, str: "", n: n, m: 0)
        return arr
    }
}
