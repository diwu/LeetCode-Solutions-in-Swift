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

Inspired by @xiaohui7 at https://leetcode.com/discuss/18970/concise-recursive-and-dp-solutions-with-full-explanation-in

*/

// Helper
private extension String {
    subscript (index: Int) -> Character {
        return self[advance(self.startIndex, index)]
    }
    subscript (range: Range<Int>) -> String {
        if range.endIndex > count(self) {
            return self[advance(self.startIndex, range.startIndex)..<advance(self.startIndex, count(self))]
        } else {
            return self[advance(self.startIndex, range.startIndex)..<advance(self.startIndex, range.endIndex)]
        }
    }
}

class Hard_010_Regular_Expression_Matching {
    // recursion
    class func isMatch_recursion(# s: String, p: String) -> Bool {
        if count(p) == 0 {
            return count(s) == 0
        }
        if count(p) > 1 && p[1] == "*" {
            return isMatch_recursion(s: s, p: p[2..<count(p)]) || count(s) != 0 && (s[0] == p[0] || p[0] == ".") && isMatch_recursion(s: s[1..<count(s)], p: p)
        } else {
            return count(s) != 0 && (s[0] == p[0] || p[0] == ".") && isMatch_recursion(s: s[1..<count(s)], p: p[1..<count(p)])
        }
    }
    // dp
    class func isMatch(# s: String, p: String) -> Bool {
        var m: Int = count(s)
        var n: Int = count(p)
        var f: [[Bool]] = Array<Array<Bool>>(count: m + 1, repeatedValue: Array<Bool>(count: n + 1, repeatedValue: false))
        f[0][0] = true
        for var i = 1; i <= m; i++ {
            f[i][0] = false
        }
        for var i = 1; i <= n; i++ {
            f[0][i] = i > 1 && "*" == p[i-1] && f[0][i-2]
        }
        for var i = 1; i <= m; i++ {
            for var j = 1; j <= n; j++ {
                if p[j-1] != "*" {
                    f[i][j] = f[i - 1][j - 1] && (s[i - 1] == p[j - 1] || "." == p[j - 1])
                } else {
                     f[i][j] = f[i][j - 2] || (s[i - 1] == p[j - 2] || "." == p[j - 2]) && f[i - 1][j]
                }
            }
        }
        return f[m][n]
    }
}