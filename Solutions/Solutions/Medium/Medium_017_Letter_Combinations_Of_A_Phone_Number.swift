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

Inspired by @lirensun at https://leetcode.com/discuss/24431/my-java-solution-with-fifo-queue

*/

private extension String {
    subscript(index: Int) -> Character {
        return self[self.startIndex.advancedBy(index)]
    }
}

private let mapping: [String] = [
    "0",
    "1",
    "abc",
    "def",
    "ghi",
    "jkl",
    "mno",
    "pqrs",
    "tuv",
    "wxyz"
]

struct Medium_017_Letter_Combinations_Of_A_Phone_Number {
    // t = O(3^N), s = O(3^N)
    static func letterCombinations(digits: String) -> [String] {
        var ans: [String] = []
        ans.append("")
        for i in 0 ..< digits.characters.count {
            let intValue: Int = Int(String(digits[i]))!
            while ans.first?.characters.count == i {
                let tmp: String = ans.removeFirst()
                for c in mapping[intValue].characters {
                    ans.append("\(tmp)\(c)")
                }
            }
        }
        return ans
    }
}