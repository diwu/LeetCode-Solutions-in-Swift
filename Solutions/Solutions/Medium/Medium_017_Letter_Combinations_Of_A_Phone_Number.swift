/*

https://leetcode.com/problems/letter-combinations-of-a-phone-number/

#17 Letter Combinations of a Phone Number

Level: medium

Given a digit string, return all possible letter combinations that the number could represent.

A mapping of digit to letters (just like on the telephone buttons) is given below.

2 -> abc
3 -> def
4 -> ghi
5 -> jkl
6 -> mno
7 -> pqrs
8 -> tuv
9 -> wxyz

Input:Digit string "23"
Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].

Note:
Although the above answer is in lexicographical order, your answer could be in any order you want.

Inspired by @wchuan91 at https://leetcode.com/discuss/1083/use-deep-first-search-dfs-idea-is-there-any-better-solutions

*/

private extension String {
    subscript(index: Int) -> Character {
        return self[self.startIndex.advancedBy(index)]
    }
    subscript(range: Range<Int>) -> String {
        return self[self.startIndex.advancedBy(range.startIndex)..<self.startIndex.advancedBy(range.endIndex)]
    }
}

class Medium_017_Letter_Combinations_Of_A_Phone_Number {
    static var dig2char: Dictionary<String, String> = [
        "2": "abc",
        "3": "def",
        "4": "ghi",
        "5": "jkl",
        "6": "mno",
        "7": "pqrs",
        "8": "tuv",
        "9": "wxyz"
    ]
    class func letterCombinations(digits: String) -> [String] {
        if digits.characters.count == 0 {
            return [""]
        }
        var result: [String] = []
        var temp: [String] = letterCombinations(digits[1..<digits.characters.count])
        let s: String = String(digits[0])
        if let unwrapped: String = dig2char[s] {
            for var i = 0; i < unwrapped.characters.count; i++ {
                for var t = 0; t < temp.count; t++ {
                    result.append(String(unwrapped[i])+temp[t])
                }
            }
        }
        return result
    }
}