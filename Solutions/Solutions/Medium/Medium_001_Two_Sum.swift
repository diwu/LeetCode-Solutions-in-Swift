/*

https://oj.leetcode.com/problems/two-sum/

#1 Two Sum

Level: medium

Given an array of integers, find two numbers such that they add up to a specific target number.

The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.

You may assume that each input would have exactly one solution.

Input: numbers={2, 7, 11, 15}, target=9
Output: index1=1, index2=2

Inspired by @naveed.zafar at https://leetcode.com/discuss/10947/accepted-c-o-n-solution

*/

struct Medium_001_Two_Sum {
    // t = O(N), s = O(N)
    static func twoSum(numbers numbers: [Int], target: Int) -> [Int] {
        var hashMap = [Int: Int]()
        var result = [Int]()

        for i in 0..<numbers.count {
            let numberToFind: Int = target - numbers[i]
            if let numberToFindIndex = hashMap[numberToFind] {
                result.append(numberToFindIndex + 1)
                result.append(i + 1)
                return result
            } else {
                hashMap[numbers[i]] = i
            }
        }
        return result
    }

}