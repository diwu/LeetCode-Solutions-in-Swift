/*

https://leetcode.com/problems/substring-with-concatenation-of-all-words/

#30 Substring with Concatenation of All Words

Level: hard

You are given a string, s, and a list of words, words, that are all of the same length. Find all starting indices of substring(s) in s that is a concatenation of each word in words exactly once and without any intervening characters.

For example, given:
s: "barfoothefoobarman"
words: ["foo", "bar"]

You should return the indices: [0,9].
(order does not matter).

Inspired by @ramakanthd92 at https://leetcode.com/discuss/366/better-solution-than-brute-force

*/

import Foundation

private extension String {
    subscript (range: Range<Int>) -> String {
        return self[self.startIndex.advancedBy(range.startIndex)..<self.startIndex.advancedBy(range.endIndex, limit: self.endIndex)]
    }
}

class Hard_030_Substring_With_Concatenation_Of_All_Words {
    class func findSubstring(s  s: String?, words: [String]) -> [Int] {
        if s == nil || words.count == 0 {
            return []
        }
        var result: [Int] = []
        var dict1: [String: Int] = [String: Int]()
        var dict2: [String: Int] = [String: Int]()
        let stringLength: Int = (s!).characters.count
        let wordsListSize: Int = words.count
        let wordLength: Int = words[0].characters.count
        for var i = 0; i < wordsListSize; i++ {
            if dict1[words[i]] == nil {
                dict1[words[i]] = 1
            } else {
                dict1[words[i]]! += 1
            }
        }
        var s1: String
        var s2: String
        var counter1: Int
        var counter2: Int
        for var i = 0; i < wordLength; i++ {
            counter1 = 0
            counter2 = i
            for var j = i; j < stringLength; j += wordLength {
                s1 = s![j..<j+wordLength]
                if dict1[s1] == nil {
                    dict2.removeAll(keepCapacity: false)
                    counter1 = 0
                    counter2 = j + wordLength
                } else if dict2[s1] == nil || dict2[s1]! < dict1[s1]! {
                    if dict2[s1] == nil {
                        dict2[s1] = 1
                    } else {
                        dict2[s1]! += 1
                    }
                    counter1++
                } else {
                    s2 = s![counter2..<counter2+wordLength]
                    while s2 != s1 {
                        dict2[s2]!--
                        counter1--
                        counter2 += wordLength
                        s2 = s![counter2..<counter2+wordLength]
                    }
                    counter2 += wordLength
                }
                if counter1 == wordsListSize {
                    result.append(counter2)
                    s2 = s![counter2..<counter2+wordLength]
                    dict2[s2]!--
                    counter1--
                    counter2 += wordLength
                }
            }
            dict2.removeAll(keepCapacity: false)
        }
        return result
    }
}
