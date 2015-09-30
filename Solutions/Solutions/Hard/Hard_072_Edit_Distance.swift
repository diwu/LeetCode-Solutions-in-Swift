/*

https://leetcode.com/problems/edit-distance/

#72 Edit Distance

Level: hard

Given two words word1 and word2, find the minimum number of steps required to convert word1 to word2. (each operation is counted as 1 step.)

You have the following 3 operations permitted on a word:

a) Insert a character
b) Delete a character
c) Replace a character

Inspired by @eaglesky1990 at https://leetcode.com/discuss/10426/my-o-mn-time-and-o-n-space-solution-using-dp-with-explanation

*/

import Foundation

private extension String {
    subscript (index: Int) -> Character {
        return self[self.startIndex.advancedBy(index)]
    }
}

struct Hard_072_Edit_Distance {
    static func minDistance(var word1 word1: String, var word2: String) -> Int {
        var len1 = word1.characters.count
        var len2 = word2.characters.count
        if len1 < len2 {
            swap(&word1, &word2)
            swap(&len1, &len2)
        }
        var buf: [Int] = Array(count: len2 + 1, repeatedValue: 0)
        for var j = 1; j <= len2; j++ {
            buf[j] = j
        }
        for var i = 1; i <= len1; i++ {
            var prev = i
            for var j = 1; j <= len2; j++ {
                var curr: Int
                if word1[i-1] == word2[j-1] {
                    curr = buf[j-1]
                } else {
                    curr = min(buf[j-1], prev, buf[j]) + 1
                }
                buf[j-1] = prev
                prev = curr
            }
            buf[len2] = prev
        }
        return buf[len2]
    }
}
