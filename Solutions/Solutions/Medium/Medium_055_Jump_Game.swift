/*

https://leetcode.com/problems/jump-game/

#55 Jump Game

Level: medium

Given an array of non-negative integers, you are initially positioned at the first index of the array.

Each element in the array represents your maximum jump length at that position.

Determine if you are able to reach the last index.

For example:
A = [2,3,1,1,4], return true.

A = [3,2,1,0,4], return false.

Inspired by @alexander7 at https://leetcode.com/discuss/15567/linear-and-simple-solution-in-c

*/

import Foundation

struct Medium_055_Jump_Game {
    static func canJump(nums: [Int]) -> Bool {
        var i = 0
        var reach = 0
        while i < nums.count && i <= reach {
            reach = max(i + nums[i], reach)
            i += 1
        }
        return i == nums.count
    }
}