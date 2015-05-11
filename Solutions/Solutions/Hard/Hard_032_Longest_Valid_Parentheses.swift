/*

https://leetcode.com/problems/longest-valid-parentheses/

#32 Longest Valid Parentheses

Level: hard

Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.

For "(()", the longest valid parentheses substring is "()", which has length = 2.

Another example is ")()())", where the longest valid parentheses substring is "()()", which has length = 4.

Inspired by @jerryrcwong at https://leetcode.com/discuss/8092/my-dp-o-n-solution-without-using-stack

*/

import Foundation

private extension String {
    subscript (index: Int) -> Character {
        return self[advance(self.startIndex, index)]
    }
}

class Hard_032_Longest_Valid_Parentheses {
    class func longestValidParentheses(s: String?) -> Int {
        if s == nil {
            return 0
        }
        if count(s!) <= 1 {
            return 0
        }
        var currentMax: Int = 0
        var longest: [Int] = Array<Int>(count: count(s!), repeatedValue: 0)
        for var i = 1; i < count(s!); i++ {
            var tmp: Int = i - longest[i-1] - 1
            if s![i] == ")" && tmp >= 0 && s![tmp] == "(" {
                longest[i] = longest[i-1] + 2 + ((tmp - 1 >= 0) ? longest[tmp-1] : 0)
                currentMax = max(longest[i], currentMax)
            }
        }
        return currentMax
    }
}
