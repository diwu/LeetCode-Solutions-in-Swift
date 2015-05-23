/*

https://leetcode.com/problems/jump-game-ii/

#45 Jump Game II 

Level: hard

Given an array of non-negative integers, you are initially positioned at the first index of the array.

Each element in the array represents your maximum jump length at that position.

Your goal is to reach the last index in the minimum number of jumps.

For example:
Given array A = [2,3,1,1,4]

The minimum number of jumps to reach the last index is 2. (Jump 1 step from index 0 to 1, then 3 steps to the last index.)

Inspired by @chentao169 at https://leetcode.com/discuss/422/is-there-better-solution-for-jump-game-ii

*/

import Foundation

struct Hard_045_Jump_Game_II {
    static func jump(nums: [Int]) -> Int {
        var result = 0;
        var last = 0;
        var curr = 0;
        for var i = 0; i < count(nums); i++ {
            if (i > last) {
                last = curr;
                result++;
            }
            curr = max(curr, i+nums[i]);
        }
        return result;
    }
}