/*

https://leetcode.com/problems/scramble-string/

#87 Scramble String

Level: hard

Given a string s1, we may represent it as a binary tree by partitioning it to two non-empty substrings recursively.

Below is one possible representation of s1 = "great":

great
/    \
gr    eat
/ \    /  \
g   r  e   at
/ \
a   t
To scramble the string, we may choose any non-leaf node and swap its two children.

For example, if we choose the node "gr" and swap its two children, it produces a scrambled string "rgeat".

rgeat
/    \
rg    eat
/ \    /  \
r   g  e   at
/ \
a   t
We say that "rgeat" is a scrambled string of "great".

Similarly, if we continue to swap the children of nodes "eat" and "at", it produces a scrambled string "rgtae".

rgtae
/    \
rg    tae
/ \    /  \
r   g  ta  e
/ \
t   a
We say that "rgtae" is a scrambled string of "great".

Given two strings s1 and s2 of the same length, determine if s2 is a scrambled string of s1.

Inspired by @Charles_p (recursion) at https://leetcode.com/discuss/3632/any-better-solution and @dtx0 (iteration) at https://leetcode.com/discuss/3632/any-better-solution

*/

import Foundation

private extension String {
    subscript (range: Range<Int>) -> String {
        guard let localEndIndex = self.characters.index(self.startIndex, offsetBy: range.upperBound, limitedBy: self.endIndex) else {
            return self[self.characters.index(self.startIndex, offsetBy: range.lowerBound)..<self.endIndex]
        }
        return self[self.characters.index(self.startIndex, offsetBy: range.lowerBound)..<localEndIndex]
    }
    subscript (index: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: index)]
    }
}

struct Hard_087_Scramble_String {
    static func isScramble(s1: String?, s2: String?) -> Bool {
        return isScramble_recursion(s1: s1, s2: s2)
    }
    static func isScramble_recursion(s1: String?, s2: String?) -> Bool {
        if s1 == nil || s2 == nil || s1?.characters.count != s2?.characters.count {
            return false
        }
        if s1 == s2 {
            return true
        }
        if (s1?.characters.sorted())! != (s2?.characters.sorted())! {
            return false
        }
        let count: Int = (s1?.characters.count)!
        for i in 1 ..< count {
            if isScramble_recursion(s1: s1![0..<i], s2: s2![0..<i]) && isScramble_recursion(s1: s1![i..<Int.max], s2: s2![i..<Int.max]) {
                return true
            }
            if isScramble_recursion(s1: s1![0..<i], s2: s2![(s2?.characters.count)! - i..<Int.max]) && isScramble_recursion(s1: s1![i..<Int.max], s2: s2![0..<(s2?.characters.count)! - i]) {
                return true
            }
        }
        return false
    }
    static func isScramble_iteration(s1: String?, s2: String?) -> Bool {
        if s1 == nil || s2 == nil || s1?.characters.count != s2?.characters.count {
            return false
        }
        let len = s1?.characters.count
        var dp: Array<Array<Array<Bool>>> = Array<Array<Array<Bool>>>(repeating: Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: 100), count: 100), count: 100)
        for i in (0...len! - 1).reversed() {
            for j in (0...len!-1).reversed() {
                dp[i][j][1] = (s1![i] == s2![j])
                var l = 2
                while i + l <= len && j + l <= len {
                    for n in 1 ..< l {
                        dp[i][j][l] = dp[i][j][l] || ( dp[i][j][n] && dp[i+n][j+n][l-n] )
                        dp[i][j][l] = dp[i][j][l] || ( dp[i][j+l-n][n] && dp[i+n][j][l-n] )
                    }
                    l += 1
                }
            }
        }
        return dp[0][0][len!]
    }
}
