/*

https://leetcode.com/problems/climbing-stairs/

#70 Climbing Stairs 

Level: easy

You are climbing a stair case. It takes n steps to reach to the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

Inspired by @facetothefate at https://leetcode.com/discuss/2809/easy-solutions-for-suggestions

*/

import Foundation

struct Easy_070_Climbing_Stairs {
    static func climbStairs(n: Int) -> Int {
        if n == 0 || n == 1  {
            return 1
        }
        var stepOne = 1
        var stepTwo = 1
        var result = 0
        for var i = 2; i <= n; i++ {
            result = stepOne + stepTwo
            stepTwo = stepOne
            stepOne = result
        }
        return result
    }
}
