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
        return self[self.characters.index(self.startIndex, offsetBy: index)]
    }
}

class Hard_032_Longest_Valid_Parentheses {
    class func longestValidParentheses(_ s: String?) -> Int {
        if s == nil {
            return 0
        }
        if (s!).characters.count <= 1 {
            return 0
        }
        var currentMax: Int = 0
        var longest: [Int] = Array<Int>(repeating: 0, count: (s!).characters.count)
        for i in 1 ..< (s!).characters.count {
            let tmp: Int = i - longest[i-1] - 1
            if s![i] == ")" && tmp >= 0 && s![tmp] == "(" {
                longest[i] = longest[i-1] + 2 + ((tmp - 1 >= 0) ? longest[tmp-1] : 0)
                currentMax = max(longest[i], currentMax)
            }
        }
        return currentMax
    }
}
