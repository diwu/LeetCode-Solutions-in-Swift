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

Inspired by @wshaoxuan at https://oj.leetcode.com/discuss/120/how-do-we-handle-the-overflow-case

*/


//Int.max   9,223,372,036,854,775,807
//Int.min   -9,223,372,036,854,775,808

class Easy_007_Reverse_Integer {
    // O (N)
    class func reverse(x: Int) -> Int {
        var neg = false
        var i: Int = x
        if x < 0 {
            neg = true
            i = -x
        }
        var res:UInt = 0
        while i/10 > 0 {
            res = res * 10 + UInt(i % 10)
            i = i / 10
        }
        res = res * 10 + UInt(i % 10)

        if neg == false && res > 9223372036854775807 {
            return 0
        } else if neg == true && res > 9223372036854775808 {
            return 0
        }

        if neg {
            return (-1) * Int(res)
        } else {
            return Int(res)
        }
    }
}