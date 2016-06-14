/*

https://leetcode.com/problems/subsets-ii/

#90 Subsets II

Given a collection of integers that might contain duplicates, nums, return all possible subsets.

Note:
Elements in a subset must be in non-descending order.
The solution set must not contain duplicate subsets.
For example,
If nums = [1,2,2], a solution is:

[
[2],
[1],
[1,2,2],
[2,2],
[1,2],
[]
]

Inspired by @mathsam at https://leetcode.com/discuss/14902/c-solution-and-explanation

*/

import Foundation

struct Medium_090_Subsets_II {
    static func subsetsWithDup(_ n: [Int]) -> [[Int]] {
        var nums = n
        var result: [[Int]] = [[]]
        nums.sort()
        var i = 0
        for _ in 0 ..< nums.count{
            var count: Int = 0
            while count + i < nums.count && nums[count+i] == nums[i] {
                count += 1
            }
            let prevSize: Int = result.count
            for k in 0 ..< prevSize {
                var tmp: [Int] = result[k]
                for _ in 0 ..< count {
                    tmp.append(nums[i])
                    result.append(tmp)
                }
            }
            i += count
        }
        return result
    }
}
