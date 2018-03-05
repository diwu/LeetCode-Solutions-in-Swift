/*

https://oj.leetcode.com/problems/longest-palindromic-substring/

#5 Longest Palindromic Substring

Level: medium

Given a string S, find the longest palindromic substring in S. You may assume that the maximum length of S is 1000, and there exists one unique longest palindromic substring.

Inspired by @hh1985 at https://leetcode.com/discuss/32204/simple-c-solution-8ms-13-lines

*/

private extension String {
    subscript (range: Range<Int>) -> String {
        return String(self[self.index(self.startIndex, offsetBy: range.lowerBound)..<self.index(self.startIndex, offsetBy: range.upperBound, limitedBy: self.endIndex)!])
    }
    /*
     Ref: http://oleb.net/blog/2014/07/swift-strings/
     "Because of the way Swift strings are stored, the String type does not support random access to its Characters via an integer index — there is no direct equivalent to NSStringʼs characterAtIndex: method. Conceptually, a String can be seen as a doubly linked list of characters rather than an array."
     
     By creating and storing a seperate array of the same sequence of characters,
     we could hopefully achieve amortized O(1) time for random access.
     */
    func randomAccessCharactersArray() -> [Character] {
        return Array(self)
    }
}

struct Medium_005_Longest_Palindromic_Substring {
    // t = O(N^2), s = O(1)
    static func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        var startIndex: Int = 0
        var maxLen: Int = 1
        var i = 0
        let charArr = s.randomAccessCharactersArray()
        while i < s.count {
            guard s.count - i > maxLen / 2 else {
                break
            }
            var j = i
            var k = i
            while k < s.count - 1 && charArr[k+1] == charArr[k] {
                k += 1
            }
            i = k + 1
            while k < s.count - 1 && j > 0 && charArr[k+1] == charArr[j-1] {
                k += 1
                j -= 1
            }
            let newLen = k - j + 1
            if newLen > maxLen {
                startIndex = j
                maxLen = newLen
            }
        }
        return String(charArr[startIndex ..< (startIndex + maxLen)])
    }
}
