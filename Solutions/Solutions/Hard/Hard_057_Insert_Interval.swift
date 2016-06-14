/*

https://leetcode.com/discuss/3971/in-place-solution-ask-for-suggestion

#57 Insert Interval

Level: hard

Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).

You may assume that the intervals were initially sorted according to their start times.

Example 1:
Given intervals [1,3],[6,9], insert and merge [2,5] in as [1,5],[6,9].

Example 2:
Given [1,2],[3,5],[6,7],[8,10],[12,16], insert and merge [4,9] in as [1,2],[3,10],[12,16].

This is because the new interval [4,9] overlaps with [3,5],[6,7],[8,10].

Inspired by @stellari at https://leetcode.com/discuss/3971/in-place-solution-ask-for-suggestion

*/

import Foundation

struct Hard_057_Insert_Interval {
    static func insert(intervals: [[Int]], newInterval newI: [Int]) -> [[Int]] {
        var newInterval = newI
        var res: [[Int]] = []
        for i in 0 ..< intervals.count {
            if newInterval[0] > intervals[i][1] {
                res.append(intervals[i])
            } else if newInterval[1] < intervals[i][0] {
                res.append(newInterval)
                newInterval = intervals[i]
            } else {
                newInterval[0] = min(newInterval[0], intervals[i][0])
                newInterval[1] = max(newInterval[1], intervals[i][1])
            }
        }
        res.append(newInterval)
        return res
    }
}
