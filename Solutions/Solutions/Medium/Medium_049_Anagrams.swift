/*

https://leetcode.com/problems/anagrams/

#49 Anagrams

Level: medium

Given an array of strings, return all groups of strings that are anagrams.

Note: All inputs will be in lower-case.

Inspired by @zxyperfect at https://leetcode.com/discuss/18664/sharing-my-very-concise-solution-with-explanation

*/

import Foundation

struct Medium_049_Anagrams {
    static func anagrams(strings: [String]) ->[String] {
        var result: [String] = []
        var sortedStrings = strings;
        var map = [String: [Int]]()
        for var i = 0; i < strings.count; i++ {
            var arr: [Character] = Array(sortedStrings[i].characters)
            arr.sortInPlace {$0 < $1}
            sortedStrings[i] = String(arr)
            if let unwrapped = map[sortedStrings[i]] {
                map[sortedStrings[i]]!.append(i)
            } else {
                map[sortedStrings[i]] = [i]
            }
        }
        for (string, intArr) in map {
            if intArr.count > 1 {
                for var i = 0; i < intArr.count; i++ {
                    result.append(strings[intArr[i]])
                }
            }
        }
        return result;
    }
}