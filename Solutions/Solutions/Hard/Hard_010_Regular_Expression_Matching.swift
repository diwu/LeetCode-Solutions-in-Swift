/*

https://oj.leetcode.com/problems/regular-expression-matching/

#10 Regular Expression Matching

Level: hard

Implement regular expression matching with support for '.' and '*'.

'.' Matches any single character.
'*' Matches zero or more of the preceding element.

The matching should cover the entire input string (not partial).

The function prototype should be:
bool isMatch(const char *s, const char *p)

Some examples:
isMatch("aa","a") → false
isMatch("aa","aa") → true
isMatch("aaa","aa") → false
isMatch("aa", "a*") → true
isMatch("aa", ".*") → true
isMatch("ab", ".*") → true
isMatch("aab", "c*a*b") → true

Inspired by @enriquewang https://oj.leetcode.com/discuss/9405/the-shortest-ac-code

*/

// Helper
private extension String {
    subscript (index: Int) -> Character {
        return self[advance(self.startIndex, index)]
    }
}

class Hard_010_Regular_Expression_Matching {
    // Whether 2 characters match or not
    // Both characters are guaranteed to be valid
    class func matchFirst(s: Character, p: Character) -> Bool {
        return s == p || p == "."
    }

    class func isMatchHelper(s: String, p: String, indexS: Int, indexP: Int) -> Bool {

        // If p is empty, s has to be empty for a match
        if indexP >= count(p) {
            return indexS >= count(s)
        }

        // If p has 2 or more characters left and the second one is not a "*"
        // Or, if p has only 1 character left
        if (indexP + 1 < count(p) && p[indexP+1] != "*") || indexP + 1 >= count(p) {
            // If the first characters of s and p doesn't match, return false
            if !matchFirst(s[indexS], p: p[indexP]) {
                return false
            } else {
                // Else, move s and p 1 character furthur and check again
                return isMatchHelper(s, p: p, indexS: indexS+1, indexP: indexP+1)
            }
        } else {
            // If s matches the post "*" part of p, return true
            if isMatchHelper(s, p: p, indexS: indexS, indexP: indexP+2) {
                return true
            }
            // Else, s needs to match the pre "*" part of p
            var i: Int = 0
            while indexS + i < count(s) && matchFirst(s[indexS+i], p: p[indexP]) {
                i++
                if isMatchHelper(s, p: p, indexS: indexS+i, indexP: indexP+2) {
                    return true
                }
            }
            return false
        }
    }
    
    class func isMatch(# s: String, p: String) -> Bool {
        return isMatchHelper(s, p: p, indexS: 0, indexP: 0)
    }
}