/*

https://oj.leetcode.com/problems/reverse-integer/

#7 Reverse Integer

Level: easy

Reverse digits of an integer.

Example1: x = 123, return 321
Example2: x = -123, return -321

Have you thought about this?

Here are some good questions to ask before coding. Bonus points for you if you have already thought through this!

If the integer's last digit is 0, what should the output be? ie, cases such as 10, 100.

Did you notice that the reversed integer might overflow? Assume the input is a 32-bit integer, then the reverse of 1000000003 overflows. How should you handle such cases?

For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.

Update (2014-11-10):
Test cases had been added to test the overflow behavior.

Inspired by @wshaoxuan at https://leetcode.com/discuss/120/how-do-we-handle-the-overflow-case

*/


//Int.max   9,223,372,036,854,775,807
//Int.min   -9,223,372,036,854,775,808

struct Easy_007_Reverse_Integer {
    // t = O(N), s = O(1)
    static func reverse(_ x: Int) -> Int {
        var negtive: Bool
        var i: UInt
        if x < 0 {
            negtive = true
            if x == Int.min {
                // The "minus 1 then add 1" trick is used to negate Int.min without overflow
                i = UInt(-(x+1))
                i += 1
            } else {
                i = UInt(-x)
            }
        } else {
            negtive = false
            i = UInt(x)
        }
        var res:UInt = 0
        while i > 0 {
            res = res * 10 + UInt(i % 10)
            i = i / 10
        }
        if negtive == false && res > UInt(Int.max) {
            return 0
        } else if negtive == true && res == UInt(Int.max) + 1 {
            // When input is the reverse of Int.min
            return (-1) * Int(res-1) - 1
        } else if negtive == true && res > UInt(Int.max) + 1 {
            return 0
        }

        if negtive {
            return (-1) * Int(res)
        } else {
            return Int(res)
        }
    }
}
