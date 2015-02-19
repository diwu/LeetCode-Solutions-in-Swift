/*

https://oj.leetcode.com/problems/longest-substring-without-repeating-characters/

#3 Longest Substring Without Repeating Characters

Level: medium

Given a string, find the length of the longest substring without repeating characters. For example, the longest substring without repeating letters for "abcabcbb" is "abc", which the length is 3. For "bbbbb" the longest substring is "b", with the length of 1.

Inspired by @heiyanbin at https://oj.leetcode.com/discuss/6168/my-o-n-solution

*/

extension String {
    subscript (index: Int) -> Character {
        var i: Index = advance(self.startIndex, index)
        return self[i]
    }
}

// O (N)
func longest(s: String) -> Int {
    var len: Int = count(s)
    if len < 2 {
        return len
    } else {
        var d: Int = 1, maxLen: Int = 1
        var map: Dictionary = Dictionary<Character, Int>()
        map[s[0]] = 0
        for i in 1..<len {
            if let v = map[s[i]] {
                if v < i - d {
                    d++
                } else {
                    d = i - v   //redundant?
                }
            } else {
                d++
            }
            map[s[i]] = i
            if d > maxLen {
                maxLen = d
            }
        }
        return maxLen
    }
}

// test cases
longest("abcabcdzaba")  //5
longest("aaaa")         //1
longest("aaabbbc")      //2
longest("")             //0
