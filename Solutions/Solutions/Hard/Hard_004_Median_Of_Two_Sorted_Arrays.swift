/*

https://leetcode.com/problems/median-of-two-sorted-arrays/

#4 Median of Two Sorted Arrays

Level: hard

There are two sorted arrays A and B of size m and n respectively. Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

Inspired by @MissMary at https://leetcode.com/discuss/15790/share-my-o-log-min-m-n-solution-with-explanation

*/

struct Hard_004_Median_Of_Two_Sorted_Arrays {
    // O (log(min(m, n)))
    static func findMedianSortedArrays(a a: [Int], b: [Int]) -> Double {
        let m = a.count
        let n = b.count

        if m > n {
            return findMedianSortedArrays(a: b, b: a)
        }

        var i_min = 0
        var i_max = m
        while i_min <= i_max {
            let i = (i_min + i_max) >> 1
            let j = ((m + n + 1) >> 1) - i
            if j > 0 && i < m && b[j-1] > a[i] {
                i_min = i + 1
            } else if i > 0 && j < n && a[i-1] > b[j] {
                i_max = i - 1
            } else {
                var num1: Int
                if i == 0 {
                    num1 = b[j-1]
                }
                else if j == 0 {
                    num1 = a[i-1]
                }
                else {
                    num1 = max(a[i-1], b[j-1])
                }

                if (m+n) & 1 != 0 {
                    return Double(num1)
                }

                var num2: Int
                if i == m {
                    num2 = b[j]
                } else if j == n {
                    num2 = a[i]
                } else {
                    num2 = min(a[i], b[j])
                }
                
                return Double((num1 + num2))/2.0
            }
        }
        return 0.0
    }
}