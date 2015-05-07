/*

https://leetcode.com/problems/remove-element/

#27 Remove Element

Level: easy

Given an array and a value, remove all instances of that value in place and return the new length.

The order of elements can be changed. It doesn't matter what you leave beyond the new length.

Inspired by @daxianji007 at https://leetcode.com/discuss/3753/my-solution-for-your-reference

*/

import Foundation

class Easy_027_Remove_Element {
    class func removeElement(inout # arr: [Int], elem: Int) -> Int {
        var begin: Int = 0
        for var i = 0; i < arr.count; i++ {
            if arr[i] != elem {
                arr[begin++] = arr[i]
            }
        }
        return begin
    }
}