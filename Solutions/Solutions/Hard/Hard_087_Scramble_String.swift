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
        return self[self.startIndex.advancedBy(range.startIndex)..<self.startIndex.advancedBy(range.endIndex, limit: self.endIndex)]
    }
    subscript (index: Int) -> Character {
        return self[self.startIndex.advancedBy(index)]
    }
}

struct Hard_087_Scramble_String {
    static func isScramble(s1 s1: String?, s2: String?) -> Bool {
        return isScramble_recursion(s1: s1, s2: s2)
    }
    static func isScramble_recursion(s1 s1: String?, s2: String?) -> Bool {
        if s1 == nil || s2 == nil || s1?.characters.count != s2?.characters.count {
            return false
        }
        if s1 == s2 {
            return true
        }
        if (s1?.characters.sort())! != (s2?.characters.sort())! {
            return false
        }
        for var i = 1; i < s1?.characters.count; i++ {
            if isScramble_recursion(s1: s1![0..<i], s2: s2![0..<i]) && isScramble_recursion(s1: s1![i..<Int.max], s2: s2![i..<Int.max]) {
                return true
            }
            if isScramble_recursion(s1: s1![0..<i], s2: s2![(s2?.characters.count)! - i..<Int.max]) && isScramble_recursion(s1: s1![i..<Int.max], s2: s2![0..<(s2?.characters.count)! - i]) {
                return true
            }
        }
        return false
    }
    static func isScramble_iteration(s1 s1: String?, s2: String?) -> Bool {
        if s1 == nil || s2 == nil || s1?.characters.count != s2?.characters.count {
            return false
        }
        let len = s1?.characters.count
        var dp: Array<Array<Array<Bool>>> = Array<Array<Array<Bool>>>(count: 100, repeatedValue: Array<Array<Bool>>(count: 100, repeatedValue: Array<Bool>(count: 100, repeatedValue: false)))
        for var i = len! - 1; i >= 0; i-- {
            for var j = len! - 1; j >= 0; j-- {
                dp[i][j][1] = (s1![i] == s2![j])
                for var l = 2; i + l <= len && j + l <= len; l++ {
                    for var n = 1; n < l; n++ {
                        dp[i][j][l] = dp[i][j][l] || ( dp[i][j][n] && dp[i+n][j+n][l-n] )
                        dp[i][j][l] = dp[i][j][l] || ( dp[i][j+l-n][n] && dp[i+n][j][l-n] )
                    }
                }
            }
        }
        return dp[0][0][len!]
    }
}