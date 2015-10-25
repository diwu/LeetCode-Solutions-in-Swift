/*

https://oj.leetcode.com/problems/longest-substring-without-repeating-characters/

#3 Longest Substring Without Repeating Characters

Level: medium

Given a string, find the length of the longest substring without repeating characters. For example, the longest substring without repeating letters for "abcabcbb" is "abc", which the length is 3. For "bbbbb" the longest substring is "b", with the length of 1.

Inspired by @heiyanbin at https://oj.leetcode.com/discuss/6168/my-o-n-solution

*/

private extension String {
    subscript (index: Int) -> Character {
        return self[self.startIndex.advancedBy(index)]
    }
}

struct Medium_003_Longest_Substring_Without_Repeating_Characters {
    // t = O(N), s = O(1)
    static func longest(s: String) -> Int {
        let len: Int = s.characters.count
        if len < 2 {
            return len
        } else {
            var tmpMaxLen: Int = 1
            var maxLen: Int = 1
            var hashMap: Dictionary<Character, Int> = Dictionary<Character, Int>()
            hashMap[s[0]] = 0
            for i in 1..<len {
                if let lastPosition = hashMap[s[i]] {
                    if lastPosition < i - tmpMaxLen {
                        tmpMaxLen++
                    } else {
                        tmpMaxLen = i - lastPosition
                    }
                } else {
                    tmpMaxLen++
                }
                hashMap[s[i]] = i
                if tmpMaxLen > maxLen {
                    maxLen = tmpMaxLen
                }
            }
            return maxLen
        }
    }
}