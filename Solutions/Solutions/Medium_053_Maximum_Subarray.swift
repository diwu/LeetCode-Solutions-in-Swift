/*

https://leetcode.com/problems/maximum-subarray/

#53 Maximum Subarray 

Level: medium

Find the contiguous subarray within an array (containing at least one number) which has the largest sum.

For example, given the array [−2,1,−3,4,−1,2,1,−5,4],
the contiguous subarray [4,−1,2,1] has the largest sum = 6.

Inspired by @john6 at https://leetcode.com/discuss/1832/ive-idea-stucked-the-exception-situation-could-somebody-help

*/

import Foundation

struct Medium_053_Maximum_Subarray {
    static func maxSubArray(var nums: [Int]) -> Int {
        var best = nums[0];
        var current = nums[0];
        
        for var i = 1; i < count(nums); i++ {
            current = max(current + nums[i], nums[i]);
            best = max(current, best);
        }
        
        return best;
    }
}