/*

https://leetcode.com/problems/implement-strstr/

#28 Implement strStr()

Implement strStr().

Returns the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

Brute-force inspired by @shichaotan at https://leetcode.com/discuss/19962/a-very-clean-solution-brute-force

KMP inspired by @zhenhai at https://leetcode.com/discuss/11814/accepted-kmp-solution-in-java-for-reference

*/

import Foundation

private extension String {
    subscript (index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}

class Easy_028_Implement_StrStr {
    class func strStr_brute_force(hayStack: String?, needle: String?) -> Int {
        if hayStack == nil || needle == nil {
            return -1
        }
        var i = 0
        while true {
            var j = 0
            while true {
                if j >= (needle!).count {
                    return i
                }
                if i + j >= (hayStack!).count {
                    return -1
                }
                if hayStack![i+j] != needle![j] {
                    break
                }
                j += 1
            }
            i += 1
        }
    }
    class func strStr_KMP(hayStack: String?, needle: String?) -> Int {
        if hayStack == nil || needle == nil {
            return -1
        }
        if (needle!).count == 0 {
            return 0
        }
        if (hayStack!).count == 0 {
            return -1
        }
        var arr: [Character] = Array((needle!).characters)
        var next: [Int] = makeNext(arr)
        var i = 0
        var j = 0
        let end = (hayStack!).count
        while i < end {
            if j == -1 || hayStack![i] == arr[j] {
                j += 1
                i += 1
                if j == arr.count {
                    return i - arr.count
                }
            }
            if i < end && hayStack![i] != arr[j] {
                j = next[j]
            }
        }
        return -1
    }
    class func makeNext(_ arr: [Character]) -> [Int] {
        var next: [Int] = [Int](repeating: -1, count: arr.count)
        var i = 0
        var j = -1
        
        while i + 1 < arr.count {
            if j == -1 || arr[i] == arr[j] {
                next[i+1] = j+1
                if arr[i+1] == arr[j+1] {
                    next[i+1] = next[j+1]
                }
                i += 1
                j += 1
            }
            if arr[i] != arr[j] {
                j = next[j]
            }
        }
        return next
    }
}
