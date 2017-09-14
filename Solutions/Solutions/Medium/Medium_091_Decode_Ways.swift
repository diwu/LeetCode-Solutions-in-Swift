/*

https://leetcode.com/problems/decode-ways/

#91 Decode Ways

Level: medium

A message containing letters from A-Z is being encoded to numbers using the following mapping:

'A' -> 1
'B' -> 2
...
'Z' -> 26
Given an encoded message containing digits, determine the total number of ways to decode it.

For example,
Given encoded message "12", it could be decoded as "AB" (1 2) or "L" (12).

The number of ways decoding "12" is 2.

Inspired by @manky at https://leetcode.com/discuss/8527/dp-solution-java-for-reference

*/

import Foundation

struct Medium_091_Decode_Ways {
    static func numDecodings(_ s: String) -> Int {
        let len = s.count
        if len == 0 { return 0 }
        let arr = [Character](s.characters)
        var dp = [Int](repeating: 0, count: len+1)
        dp[len] = 1
        dp[len-1] = (arr[len-1] == "0") ? 0 : 1
        for i in (0..<len-1).reversed() {
            if arr[i] == "0" { continue }
            else {
                let v = Int(String(arr[i...i+1]))
                if let vv = v {
                    if vv <= 26 { dp[i] = dp[i+1] + dp[i+2] }
                    else { dp[i] = dp[i+1] }
                } else { fatalError() }
            }
        }
        return dp[0]
    }
}
