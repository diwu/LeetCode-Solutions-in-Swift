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
    func randomAccessCharacterArray() -> Array<Character> {
        return Array(self)
    }
}

struct Easy_020_Valid_Parentheses {
    // t=O(N), s=O(N)
    static func isValid(_ s: String) -> Bool {
        let charArr = s.randomAccessCharacterArray()
        let dict: Dictionary<Character, Character> = [
            "}":"{",
            "]":"[",
            ")":"("
        ]
        var stack: Array<Character> = []
        for char in charArr {
            if char == "}" || char == ")" || char == "]" {
                if stack.isEmpty || stack.last != dict[char] {
                    return false
                } else {
                    stack.removeLast()
                }
            } else {
                stack.append(char)
            }
        }
        return stack.isEmpty
    }
}
