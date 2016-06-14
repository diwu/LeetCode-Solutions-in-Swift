/*

https://leetcode.com/problems/interleaving-string/

#97 Interleaving String

Level: hard

Given s1, s2, s3, find whether s3 is formed by the interleaving of s1 and s2.

For example,
Given:
s1 = "aabcc",
s2 = "dbbca",

When s3 = "aadbbcbcac", return true.
When s3 = "aadbbbaccc", return false.

Inspired by @sherryxmhe at https://leetcode.com/discuss/11694/my-dp-solution-in-c

*/

import Foundation

private extension String {
    subscript(index: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: index)]
    }
}

struct Hard_097_Interleaving_String {
    // t = O(N*M), s = O(N*M)
    static func isInterleave(s1: String, s2: String, s3: String) -> Bool {
        if s1.characters.count + s2.characters.count != s3.characters.count {
            return false
        }
        var dp: [[Bool]] = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: s2.characters.count+1), count: s1.characters.count+1)
        for i in 0 ..< s1.characters.count + 1{
            for j in 0 ..< s2.characters.count + 1{
                if i == 0 && j == 0 {
                    dp[0][0] = true
                } else if i == 0 {
                    dp[0][j] = dp[0][j-1] && (s2[j-1] == s3[j-1])
                } else if j == 0 {
                    dp[i][0] = dp[i-1][0] && (s1[i-1] == s3[i-1])
                } else {
                    dp[i][j] = (dp[i][j-1] && (s2[j-1] == s3[i+j-1])) || (dp[i-1][j] && (s1[i-1] == s3[i+j-1]))
                }
            }
        }
        return dp[s1.characters.count][s2.characters.count]
    }
}
