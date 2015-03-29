/*

https://leetcode.com/problems/container-with-most-water/

#11 Container With Most Water

Level: medium

Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.

Note: You may not slant the container.

Inspired by @franticguy at https://leetcode.com/discuss/14610/very-simple-o-n-solution

*/

class Medium_011_Container_With_Most_Water {
    // O (N)
    class func maxArea(# heightsArray: [Int]) -> Int {
        var j: Int = count(heightsArray) - 1
        var i: Int = 0
        var mx: Int = 0

        while i < j {
            mx = max(mx, (j-i) * min(heightsArray[i], heightsArray[j]))

            if heightsArray[i] < heightsArray[j] {
                i++
            } else {
                j--
            }
        }
        return mx
    }
}