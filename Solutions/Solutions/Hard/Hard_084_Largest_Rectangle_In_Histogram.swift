/*

https://leetcode.com/problems/largest-rectangle-in-histogram/

#84 Largest Rectangle in Histogram

Level: hard

Given n non-negative integers representing the histogram's bar height where the width of each bar is 1, find the area of largest rectangle in the histogram.


Above is a histogram where width of each bar is 1, given height = [2,1,5,6,2,3].


The largest rectangle is shown in the shaded area, which has area = 10 unit.

For example,
Given height = [2,1,5,6,2,3],
return 10.

Inspired by http://www.geeksforgeeks.org/largest-rectangle-under-histogram/

*/

import Foundation

struct Hard_084_Largest_Rectangle_In_Histogram {
    static func largestRectangleArea(heights: [Int]) -> Int {
        var stack:[Int] = []
        var max_area = 0
        var top_of_stack: Int
        var area_with_top: Int
        var i = 0
        while i < heights.count {
            if stack.isEmpty || heights[stack.last!] <= heights[i] {
                stack.append(i)
                i += 1
            } else {
                top_of_stack = stack.last!
                stack.removeLast()
                area_with_top = heights[top_of_stack] * (stack.isEmpty ? i : i - stack.last! - 1)
                if max_area < area_with_top {
                    max_area = area_with_top
                }
            }
        }
        while stack.isEmpty == false {
            top_of_stack = stack.last!
            stack.removeLast()
            area_with_top = heights[top_of_stack] * (stack.isEmpty ? i : i - stack.last! - 1)
            if max_area < area_with_top {
                max_area = area_with_top
            }
        }
        return max_area
    }
}