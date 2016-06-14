/*

https://leetcode.com/problems/merge-intervals/

#56 Merge Intervals

Level: hard

Given a collection of intervals, merge all overlapping intervals.

For example,
Given [1,3],[2,6],[8,10],[15,18],
return [1,6],[8,10],[15,18].

Inspired by @brubru777 at https://leetcode.com/discuss/13953/a-simple-java-solution

*/

import Foundation

struct Hard_056_Merge_Intervals {
    static func merge(_ itv: [[Int]]) -> [[Int]] {
        var intervals = itv
        if intervals.count <= 1 {
            return intervals
        }
        intervals.sort { (elm1, elm2) -> Bool in
            var e1 = elm1
            var e2 = elm2
            return e1[0] <= e2[0]
        }
        var res = [[Int]]()
        var start = intervals[0][0]
        var end = intervals[0][1]
        
        for var i in intervals {
            if i[0] <= end {
                end = max(end, i[1])
            } else {
                res.append([start, end])
                start = i[0]
                end = i[1]
            }
        }
        
        res.append([start, end])
        return res
    }
}
