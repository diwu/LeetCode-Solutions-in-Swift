/*

https://leetcode.com/problems/combination-sum/

#39 Combination Sum

Level: medium

Given a set of candidate numbers (C) and a target number (T), find all unique combinations in C where the candidate numbers sums to T.

The same repeated number may be chosen from C unlimited number of times.

Note:
All numbers (including target) will be positive integers.
Elements in a combination (a1, a2, … , ak) must be in non-descending order. (ie, a1 ≤ a2 ≤ … ≤ ak).
The solution set must not contain duplicate combinations.
For example, given candidate set 2,3,6,7 and target 7,
A solution set is:
[7]
[2, 2, 3]

Inspired by @dylan_yu at https://leetcode.com/discuss/10141/a-solution-avoid-using-set

*/

import Foundation

struct Medium_039_Combination_Sum {
    private static func recurse(list  list: [Int], target: Int, candidates: [Int], index: Int, inout result: [[Int]]) {
        if target == 0 {
            result.append(list)
            return
        }
        for i in index ..< candidates.count {
            let newTarget: Int = target - candidates[i]
            if newTarget >= 0 {
                var copy: [Int] = Array<Int>(list)
                copy.append(candidates[i])
                recurse(list: copy, target: newTarget, candidates: candidates, index: i, result: &result)
            } else {
                break
            }
        }
    }
    static func combinationSum(candidates cdts: [Int], target: Int) -> [[Int]] {
        var candidates = cdts
        var result: [[Int]] = []
        candidates.sortInPlace {$0 < $1}
        recurse(list: [Int](), target: target, candidates: candidates, index: 0, result: &result)
        return result
    }
}


