/*

https://leetcode.com/problems/divide-two-integers/

#29 Divide Two Integers 

Level: meidum

Divide two integers without using multiplication, division and mod operator.

If it is overflow, return MAX_INT.

Inspired by @lucastan & @ngcl at https://leetcode.com/discuss/11358/simple-o-log-n-2-c-solution

*/

import Foundation

struct Medium_029_Divide_Two_Integers {
    static func divide(dividend: Int, divisor: Int) -> Int {
        if divisor == 0 {
            return Int.max
        }
        if divisor == 1 {
            return dividend
        }
        if dividend == Int.min && divisor == Int.min {
            return 1
        }
        if dividend == Int.min && abs(divisor) == 1 {
            return Int.max
        }
        var answer: UInt = 0
        var absDividend: UInt = dividend == Int.min ? UInt(UInt(Int.max) + 1) : UInt(abs(dividend))
        let absDivisor: UInt = divisor == Int.min ? UInt(UInt(Int.max) + 1) : UInt(abs(divisor))
        while absDividend >= absDivisor {
            var tmp: UInt = UInt(absDivisor)
            var power: UInt = 1
            while tmp << 1 < absDividend {
                tmp <<= 1
                power <<= 1
            }
            answer += power
            absDividend -= tmp
        }
        if (dividend < 0 && divisor > 0) || (dividend > 0 && divisor < 0) {
            return 0 - Int(answer)
        }
        return Int(answer)
    }
}
