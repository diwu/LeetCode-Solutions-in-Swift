/*

https://leetcode.com/problems/permutation-sequence/

#60 Permutation Sequence

Level: medium

The set [1,2,3,…,n] contains a total of n! unique permutations.

By listing and labeling all of the permutations in order,
We get the following sequence (ie, for n = 3):

"123"
"132"
"213"
"231"
"312"
"321"
Given n and k, return the kth permutation sequence.

Note: Given n will be between 1 and 9 inclusive.

Inspired by @lucastan at https://leetcode.com/discuss/11023/most-concise-c-solution-minimal-memory-required

*/

import Foundation

struct Medium_060_Permutation_Sequence {
    static func getPermutation(n n: Int, k arg: Int) -> String {
        var k = arg
        var j: Int
        var f: Int = 1
        var s = [Character](count: n, repeatedValue: "0")
        let map: [Int: Character] = [1: "1", 2: "2", 3: "3", 4: "4", 5: "5", 6: "6", 7: "7", 8: "8", 9: "9"]
        for i in 1...n {
            f *= i
            s[i-1] = map[i]!
        }
        k -= 1
        for i in 0..<n {
            f /= n - i
            j = i + k / f
            let c = s[j]
            if j > i {
                for m in (i+1...j).reverse() {
                    s[m] = s[m-1]
                }
            }
            k %= f
            s[i] = c
        }
        return String(s)
    }
}