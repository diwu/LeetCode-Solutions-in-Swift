/*

https://leetcode.com/problems/3sum/

#15 3Sum

Level: medium

Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

Note:
Elements in a triplet (a,b,c) must be in non-descending order. (ie, a ≤ b ≤ c)
The solution set must not contain duplicate triplets.
For example, given array S = {-1 0 1 2 -1 -4},

A solution set is:
(-1, 0, 1)
(-1, -1, 2)

Inspired by @peerlessbloom at https://leetcode.com/discuss/10756/my-accepted-o-n-2-solution-without-hashmap

*/

class Medium_015_3Sum {
    // O (N^2)
    class func threeSum( num: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        if count(num) < 3 {
            return res
        } else {
            var sorted: [Int] = num.sorted{$0 < $1}
            var twoSum: Int
            var size: Int = count(sorted)
            for var i = 0; i <  size - 2; {
                var l: Int = i + 1
                var r: Int = size - 1
                twoSum = 0 - sorted[i]
                while l < r {
                    if sorted[l] + sorted[r] < twoSum {
                        l++
                    } else if sorted[l] + sorted[r] == twoSum {
                        var three: [Int] = []
                        three.append(sorted[i])
                        three.append(sorted[l])
                        three.append(sorted[r])
                        res.append(three)
                        do {
                            l++
                        } while l < r && sorted[l-1] == sorted[l]
                        do {
                            r--
                        } while l < r && sorted[r+1] == sorted[r]
                    } else {
                        r--
                    }
                }
                do {
                    i++
                } while i < size - 1 && sorted[i-1] == sorted[i]
            }
            return res
        }
    }
}