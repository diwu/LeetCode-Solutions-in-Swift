/*

https://leetcode.com/problems/valid-number/

#65 Valid Number 

Level: hard

Validate if a given string is numeric.

Some examples:
"0" => true
" 0.1 " => true
"abc" => false
"1 a" => false
"2e10" => true

Note: It is intended for the problem statement to be ambiguous. You should gather all requirements up front before implementing one.

Inspired by @Echo-yang at https://leetcode.com/discuss/13691/c-my-thought-with-dfa

*/

import Foundation

private extension String {
    subscript (index: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: index)]
    }
    mutating func removeAtIndex(_ index: Int) -> Character {
        return self.remove(at: self.index(self.startIndex, offsetBy: index))
    }
}

struct Hard_065_Valid_Number {
    static func isNumber(_ arg: String) -> Bool {
        var s = arg
        var state = 0
        var flag = 0
        while s[0] == " " {
            s.removeAtIndex(0)
        }
        while s[s.characters.count-1] == " " {
            s.removeAtIndex(s.characters.count-1)
        }
        let digits: [Character: Int] = [
            "0": 0,
            "1": 1,
            "2": 2,
            "3": 3,
            "4": 4,
            "5": 5,
            "6": 6,
            "7": 7,
            "8": 8,
            "9": 9,
        ]
        for i in 0 ..< s.characters.count {
            if digits[s[i]] != nil {
                flag = 1
                if state <= 2 {
                    state = 2
                } else {
                    state = state <= 5 ? 5 : 7
                }
            } else if s[i] == "+" || s[i] == "-" {
                if state == 0 || state == 3 {
                    state += 1
                } else {
                    return false
                }
            } else if "." == s[i] {
                if state <= 2 {
                    state = 6
                } else {
                    return false
                }
            } else if "e" == s[i] {
                if flag == 1 && (state == 2 || state == 6 || state == 7) {
                    state = 3
                } else {
                    return false
                }
            } else {
                return false
            }
        }
        return (state == 2 || state == 5 || (flag == 1 && state == 6) || state == 7)
    }
}
