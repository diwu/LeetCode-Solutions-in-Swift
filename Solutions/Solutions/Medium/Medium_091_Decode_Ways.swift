/*

https://leetcode.com/problems/decode-ways/

#91 Decode Ways

Level: medium

A message containing letters from A-Z is being encoded to numbers using the following mapping:

'A' -> 1
'B' -> 2
...
'Z' -> 26
Given an encoded message containing digits, determine the total number of ways to decode it.

For example,
Given encoded message "12", it could be decoded as "AB" (1 2) or "L" (12).

The number of ways decoding "12" is 2.

Inspired by @manky at https://leetcode.com/discuss/8527/dp-solution-java-for-reference

*/

import Foundation

private extension String {
    subscript (index: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: index)]
    }
    subscript (range: Range<Int>) -> String {
        return self[self.characters.index(self.startIndex, offsetBy: range.lowerBound)..<self.characters.index(self.startIndex, offsetBy: range.upperBound, limitedBy: self.endIndex)!]
    }
}

struct Medium_091_Decode_Ways {
    static func numDecodings(_ s: String) -> Int {
        let n: Int = s.characters.count
        if n == 0 {
            return 0
        }
        var memo: [Int] = Array<Int>(repeating: 0, count: n+1)
        memo[n] = 1
        memo[n-1] = s[n-1] != "0" ? 1 : 0
        for i in (0 ... n-2).reversed() {
            if s[i] == "0" {
                continue
            } else {
                memo[i] = Int(s[i..<i+2])! <= 26 ? memo[i+1]+memo[i+2] : memo[i+1]
            }
        }
        return memo[0]
    }
}
