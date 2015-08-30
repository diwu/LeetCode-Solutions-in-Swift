/*

https://leetcode.com/problems/wildcard-matching/

#44 Wildcard Matching 

Level: hard

Implement wildcard pattern matching with support for '?' and '*'.

'?' Matches any single character.
'*' Matches any sequence of characters (including the empty sequence).

The matching should cover the entire input string (not partial).

The function prototype should be:
bool isMatch(const char *s, const char *p)

Some examples:
isMatch("aa","a") → false
isMatch("aa","aa") → true
isMatch("aaa","aa") → false
isMatch("aa", "*") → true
isMatch("aa", "a*") → true
isMatch("ab", "?*") → true
isMatch("aab", "c*a*b") → false

Inspired by @pandora111 at https://leetcode.com/discuss/10133/linear-runtime-and-constant-space-solution

*/

import Foundation

private extension String {
    subscript(index: Int) -> Character {
        return self[self.startIndex.advancedBy(index)]
    }
}

struct Hard_044_Wildcard_Matching {
    static func isMatch(s  s: String, p: String) -> Bool {
        var sIndex = 0
        var pIndex = 0
        var match = 0
        var startIndex = -1
        while sIndex < s.characters.count {
            if pIndex < p.characters.count && (p[pIndex] == "?" || s[sIndex] == p[pIndex]) {
                sIndex++
                pIndex++
            } else if pIndex < p.characters.count && p[pIndex] == "*" {
                startIndex = pIndex
                match = sIndex
                pIndex++
            } else if startIndex != -1 {
                pIndex = startIndex + 1
                match++
                sIndex = match
            } else {
                return false
            }
        }
        while pIndex < p.characters.count && p[pIndex] == "*" {
            pIndex++
        }
        return pIndex == p.characters.count
    }
}
