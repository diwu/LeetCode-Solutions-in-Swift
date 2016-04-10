/*

https://oj.leetcode.com/problems/longest-palindromic-substring/

#5 Longest Palindromic Substring

Level: medium

Given a string S, find the longest palindromic substring in S. You may assume that the maximum length of S is 1000, and there exists one unique longest palindromic substring.

Inspired by @hh1985 at https://leetcode.com/discuss/32204/simple-c-solution-8ms-13-lines

*/

private extension String {
    subscript (i: Int) -> Character {
        let index: Index = self.startIndex.advancedBy(i)
        return self[index]
    }
    subscript (range: Range<Int>) -> String {
        return self[self.startIndex.advancedBy(range.startIndex)..<self.startIndex.advancedBy(range.endIndex, limit: self.endIndex)]
    }
}

struct Medium_005_Longest_Palindromic_Substring {
    // t = O(N^2), s = O(1)
    static func longestPalindrome(s: String) -> String {
        if s.characters.count == 0 {
            return ""
        } else if s.characters.count == 1 {
            return s
        } else {
            var min_start: Int = 0
            var max_len: Int = 1
            var i = 0
            while i < s.characters.count {
                if s.characters.count - i <= max_len / 2 {
                    break
                }
                var j = i
                var k = i
                while k < s.characters.count - 1 && s[k+1] == s[k] {
                    k += 1
                }
                i = k + 1
                while k < s.characters.count - 1 && j > 0 && s[k+1] == s[j-1] {
                    k += 1
                    j -= 1
                }
                let new_len = k - j + 1
                if new_len > max_len {
                    min_start = j
                    max_len = new_len
                }
            }
            return s[min_start ..< (min_start + max_len)]
        }
    }
}