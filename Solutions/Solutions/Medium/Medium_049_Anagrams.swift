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
    static func anagrams(_ strings: [String]) ->[String] {
        var result: [String] = []
        var sortedStrings = strings;
        var map = [String: [Int]]()
        for i in 0 ..< strings.count {
            var arr: [Character] = Array(sortedStrings[i].characters)
            arr.sort {$0 < $1}
            sortedStrings[i] = String(arr)
            if let _ = map[sortedStrings[i]] {
                map[sortedStrings[i]]!.append(i)
            } else {
                map[sortedStrings[i]] = [i]
            }
        }
        for (_, intArr) in map {
            if intArr.count > 1 {
                for i in 0 ..< intArr.count {
                    result.append(strings[intArr[i]])
                }
            }
        }
        return result;
    }
}
