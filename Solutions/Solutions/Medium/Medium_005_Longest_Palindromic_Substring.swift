/*

https://oj.leetcode.com/problems/longest-palindromic-substring/

#5 Longest Palindromic Substring

Level: medium

Given a string S, find the longest palindromic substring in S. You may assume that the maximum length of S is 1000, and there exists one unique longest palindromic substring.

Inspired by @hanleyChu at https://oj.leetcode.com/discuss/9948/a-very-brief-o-n-time-o-1-space-solution-ac

*/

// Helper
private extension String {
    subscript (index: Int) -> Character {
        var i: Index = advance(self.startIndex, index)
        return self[i]
    }
    subscript (integerRange: Range<Int>) -> String {
        return self[advance(startIndex, integerRange.startIndex)..<advance(startIndex, integerRange.endIndex+1, self.endIndex)]

    }
}

class Medium_005_Longest_Palindromic_Substring {
    // Helper
    class func isPalindrome(s: String, startPosition: Int, endPosition: Int) -> Bool {
        var len = endPosition - startPosition + 1
        for i in 0..<len/2 {
            if s[i + startPosition] != s[len - 1 - i + startPosition] {
                return false
            }
        }
        return true
    }

    // O (N ^ 2)
    class func longest(s: String) -> String {
        var longestLength = 0, longestIndex = 0, n = count(s)
        var len = 0
        for currentIndex in 0..<n {
            if isPalindrome(s, startPosition: currentIndex - longestLength, endPosition: currentIndex) {
                longestLength += 1
                longestIndex = currentIndex
            } else if currentIndex - longestLength - 1 >= 0 && isPalindrome(s, startPosition: currentIndex - longestLength - 1, endPosition: currentIndex) {
                longestLength += 2
                longestIndex = currentIndex
            }
        }
        return s[longestIndex - longestLength + 1 ..< longestIndex]
    }
}