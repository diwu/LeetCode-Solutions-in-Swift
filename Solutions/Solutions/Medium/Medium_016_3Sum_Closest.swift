/*

https://leetcode.com/problems/3sum-closest/

#16 3Sum Closest

Level: medium

Given an array S of n integers, find three integers in S such that the sum is closest to a given number, target. Return the sum of the three integers. You may assume that each input would have exactly one solution.

For example, given array S = {-1 2 1 -4}, and target = 1.

The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).

Inspired by @vaibhavatul47 at https://leetcode.com/discuss/6438/a-n-2-solution-can-we-do-better

*/

class Medium_016_3Sum_Closest {
    // O( N^2 )
    class func threeSumClosest(num: [Int], target: Int) -> Int {
        let n: Int = num.count
        if n <= 3 {
            return num.reduce(0, combine: +)
        } else {
            var ans: Int = 0
            var sum: Int
            var sorted: [Int] = num.sorted { $0 < $1 }
            ans = sorted[0] + sorted[1] + sorted[2]
            for i in 0 ..< n-2 {
                var j: Int = i+1
                var k: Int = n-1
                while (j < k) {
                    sum = sorted[i] + sorted[j] + sorted[k]
                    if abs(target - ans) > abs(target - sum) {
                        ans = sum
                        if ans == target {
                            return ans
                        }
                    }

                    if sum > target {
                        k -= 1
                    } else {
                        j += 1
                    }

                }
            }
            return ans
        }
    }
}
