/*

https://leetcode.com/problems/anagrams/

#49 Anagrams

Level: medium

 Given an array of strings, group anagrams together.
 
 For example, given: ["eat", "tea", "tan", "ate", "nat", "bat"], 
 Return:
 
 [
     ["ate", "eat","tea"],
     ["nat","tan"],
     ["bat"]
 ]
 
 Note: All inputs will be in lower-case.

Inspired by @zxyperfect at https://leetcode.com/discuss/18664/sharing-my-very-concise-solution-with-explanation

*/

import Foundation

struct Medium_049_Anagrams {
    private static func helper(_ str: String) -> String {
        var arr = Array(str.characters)
        arr.sort()
        return String(arr)
    }
    static func anagrams(_ strings: [String]) -> [[String]] {
        var dict: [String: [String]] = [:]
        for s in strings {
            let sortedS = helper(s)
            var arr = dict[sortedS]
            if let _ = arr {
                arr!.append(s)
            } else {
                arr = [s]
            }
            dict[sortedS] = arr!
        }
        return Array(dict.values)
    }
}
