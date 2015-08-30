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
        return self[self.startIndex.advancedBy(index)]
    }
}

class Easy_028_Implement_StrStr {
    class func strStr_brute_force(hayStack  hayStack: String?, needle: String?) -> Int {
        if hayStack == nil || needle == nil {
            return -1
        }
        for var i = 0; ; i++ {
            for var j = 0; ; j++ {
                if j >= (needle!).characters.count {
                    return i
                }
                if i + j >= (hayStack!).characters.count {
                    return -1
                }
                if hayStack![i+j] != needle![j] {
                    break
                }
            }
        }
    }
    class func strStr_KMP(hayStack  hayStack: String?, needle: String?) -> Int {
        if hayStack == nil || needle == nil {
            return -1
        }
        if (needle!).characters.count == 0 {
            return 0
        }
        if (hayStack!).characters.count == 0 {
            return -1
        }
        var arr: [Character] = Array((needle!).characters)
        var next: [Int] = makeNext(arr)
        for var i = 0, j = 0, end = (hayStack!).characters.count; i < end; {
            if j == -1 || hayStack![i] == arr[j] {
                j++;
                i++;
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
    class func makeNext(arr: [Character]) -> [Int] {
        var next: [Int] = [Int](count: arr.count, repeatedValue: -1)
        for var i = 0, j = -1; i + 1 < arr.count; {
            if j == -1 || arr[i] == arr[j] {
                next[i+1] = j+1
                if arr[i+1] == arr[j+1] {
                    next[i+1] = next[j+1]
                }
                i++
                j++
            }
            if arr[i] != arr[j] {
                j = next[j]
            }
        }
        return next
    }
}
