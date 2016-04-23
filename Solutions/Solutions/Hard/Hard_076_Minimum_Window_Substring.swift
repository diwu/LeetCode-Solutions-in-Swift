/*

https://leetcode.com/problems/minimum-window-substring/

#76 Minimum Window Substring

Level: hard

Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).

For example,
S = "ADOBECODEBANC"
T = "ABC"
Minimum window is "BANC".

Note:
If there is no such window in S that covers all characters in T, return the emtpy string "".

If there are multiple such windows, you are guaranteed that there will always be only one unique minimum window in S.

Inspired by @heleifz at https://leetcode.com/discuss/10337/accepted-o-n-solution

*/

import Foundation

private extension String {
    subscript (index: Int) -> Character {
        return self[self.startIndex.advancedBy(index)]
    }
}

struct Hard_076_Minimum_Window_Substring {
    static func minWindow(s s: String, t: String) -> String {
        if s.isEmpty || t.isEmpty {
            return ""
        }
        var count = t.characters.count
        var charCountDict: Dictionary<Character, Int> = Dictionary()
        var charFlagDict: Dictionary<Character, Bool> = Dictionary()
        for ii in 0 ..< count {
            if let charCount = charCountDict[t[ii]] {
                charCountDict[t[ii]] = charCount + 1
            } else {
                charCountDict[t[ii]] = 1
            }
            charFlagDict[t[ii]] = true
        }
        var i = -1
        var j = 0
        var minLen = Int.max
        var minIdx = 0
        while i < s.characters.count && j < s.characters.count {
            if count > 0 {
                i += 1
                if i == s.characters.count {
                    continue
                }
                if let charCount = charCountDict[s[i]] {
                    charCountDict[s[i]] = charCount - 1
                } else {
                    charCountDict[s[i]] = -1
                }
                if charFlagDict[s[i]] == true && charCountDict[s[i]] >= 0 {
                    count -= 1
                }
            } else {
                if minLen > i - j + 1 {
                    minLen = i - j + 1
                    minIdx = j
                }
                if let charCount = charCountDict[s[j]] {
                    charCountDict[s[j]] = charCount + 1
                } else {
                    charCountDict[s[j]] = 1
                }
                if charFlagDict[s[j]] == true && charCountDict[s[j]] > 0 {
                    count += 1
                }
                j += 1
            }
        }
        if minLen == Int.max {
            return ""
        }
        let range = s.startIndex.advancedBy(minIdx) ..< s.startIndex.advancedBy(minIdx + minLen)
        return s.substringWithRange(range)
    }
}