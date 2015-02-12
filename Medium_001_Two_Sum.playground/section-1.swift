/*

https://oj.leetcode.com/problems/two-sum/

#1 Two Sum

Level: medium

Given an array of integers, find two numbers such that they add up to a specific target number.

The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.

You may assume that each input would have exactly one solution.

Input: numbers={2, 7, 11, 15}, target=9
Output: index1=1, index2=2

Inspired by @naveed.zafar at https://oj.leetcode.com/discuss/10947/accepted-c-o-n-solution

*/

import Foundation

// O(N)
func twoSum(numbers: Array<Int>, target: Int) -> Array<Int> {
    var hashMap: Dictionary = Dictionary<Int, Int>()
    var result: Array = Array<Int>()

    for i in 0..<numbers.count {
        var numberToFind: Int = target - numbers[i]
        if let numberToFindIndex = hashMap[numberToFind]? {
            result.append(numberToFindIndex + 1)
            result.append(i + 1)
            return result
        } else {
            hashMap[numbers[i]] = i
        }
    }
    return result
}

// test cases
twoSum([2, 7, 11, 15], 9)   //[1, 2]
twoSum([5, 5], 10)          //[1, 2]


