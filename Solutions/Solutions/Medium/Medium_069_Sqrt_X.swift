/*

https://leetcode.com/problems/sqrtx/

#69 Sqrt(x)

Level: medium

Implement int sqrt(int x).

Compute and return the square root of x.

Inspired by @tyuan73 at https://leetcode.com/discuss/8897/share-my-o-log-n-solution-using-bit-manipulation

*/

import Foundation

struct Medium_069_Sqrt_X {
    static func mySqrt(_ x: Int) -> Int {
        var ans: Int64 = 0
        var bit: Int64 = 1 << 16
        while bit > 0 {
            ans |= bit
            if ans * ans > Int64(x) {
                ans ^= bit
            }
            bit >>= 1
        }
        return Int(ans)
    }
}
