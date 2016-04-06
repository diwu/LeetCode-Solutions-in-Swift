/*

https://leetcode.com/problems/powx-n/

#50 Pow(x, n) 

Level: medium

Implement pow(x, n).

Inspired by @pei heng at https://leetcode.com/discuss/17005/short-and-easy-to-understand-solution

*/

import Foundation

struct Medium_050_Pow_X_N {
    static func myPow(x arg0: Double, n arg1: Int) -> Double {
        var x = arg0
        var n = arg1
        if n == 0 {
            return 1;
        }
        if n < 0 {
            n = -n;
            x = 1/x;
        }
        return ( n % 2 == 0) ? myPow(x: x*x, n: n/2) : x * myPow(x: x*x, n: n/2);
    }
}