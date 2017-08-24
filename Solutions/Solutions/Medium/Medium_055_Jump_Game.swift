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

*/

import Foundation

struct Medium_055_Jump_Game {
    static func canJump(_ nums: [Int]) -> Bool {
        if nums.count == 0 { return false }
        var curr = nums[0]
        for i in 1 ..< nums.count {
            if curr == 0 { return false }
            curr = max(curr - 1, nums[i])
        }
        return true
    }
}
