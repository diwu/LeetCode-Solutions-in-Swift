/*

https://leetcode.com/problems/valid-parentheses/

#20 Valid_Parentheses

Level: easy

Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.

Inspired by @exodia at https://leetcode.com/discuss/21440/sharing-my-simple-cpp-code-with-2ms

*/

import Foundation

private extension String {
    subscript (index: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: index)]
    }
}

class Easy_020_Valid_Parentheses {
    class func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        var temp: Character
        var dict: Dictionary<Character, Character> = Dictionary()
        dict["]"] = "["
        dict[")"] = "("
        dict["}"] = "{"
        for i in 0..<s.characters.count {
            temp = s[i]
            if temp == ")" || temp == "}" || temp == "]" {
                if stack.count == 0 || stack.last != dict[temp] {
                    return false
                } else {
                    stack.removeLast()
                }
            } else {
                stack.append(temp)
            }
        }
        if stack.count == 0 {
            return true
        } else {
            return false
        }
    }
}
