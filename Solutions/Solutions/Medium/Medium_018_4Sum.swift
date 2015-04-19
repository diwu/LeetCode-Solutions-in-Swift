/*

https://leetcode.com/problems/4sum/

#18 4Sum

Given an array S of n integers, are there elements a, b, c, and d in S such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.

Note:

Elements in a quadruplet (a,b,c,d) must be in non-descending order. (ie, a ≤ b ≤ c ≤ d)

The solution set must not contain duplicate quadruplets.
For example, given array S = {1 0 -1 0 -2 2}, and target = 0.

A solution set is:
(-1,  0, 0, 1)
(-2, -1, 1, 2)
(-2,  0, 0, 2)

Inspired by @zhaohaoshu at https://leetcode.com/discuss/9141/any-better-solution-than-o-n-3

*/

func == (this: Medium_018_4Sum.Pair?, that: Medium_018_4Sum.Pair?) -> Bool {
    if let unwrappedThis = this {
        if let unwrappedThat = that {
            return unwrappedThis.a == unwrappedThat.a && unwrappedThis.b == unwrappedThat.b
        } else {
            return false
        }
    } else {
        return that == nil
    }
}

class Medium_018_4Sum {

    class Pair {
        var a: Int, ai: Int, b: Int, bi: Int
        init(a: Int, ai: Int, b: Int, bi: Int) {
            self.a = a
            self.ai = ai
            self.b = b
            self.bi = bi
        }
    }

    class func fourSum(# num: [Int], target: Int) -> [[Int]] {
        var res: [[Int]] = []
        if count(num) < 4 {
            return res
        }
        var sortedNum: [Int] = num.sorted{ $0 < $1 }
        var map: Dictionary<Int, [Pair]> = Dictionary<Int, [Pair]>()
        var array: [Int] = []
        for i in 0..<sortedNum.count {
            for j in i+1..<sortedNum.count {
                var pair: Pair = Pair(a: sortedNum[i], ai: i, b: sortedNum[j], bi: j)
                var sum = sortedNum[i] + sortedNum[j]
                if map[sum] != nil {
                    map[sum]!.append(pair)
                } else {
                    map[sum] = [pair]
                    array.append(sum)
                }
            }
        }
        var first: Int = array.first!
        var last: Int = array.last!
        while first <= last {
            if first + last > target {
                if let unwrapped = lowerKey(key: last, arr: array) {
                    last = unwrapped
                } else {
                    break
                }
            } else if first + last < target {
                if let unwrapped = higherKey(key: first, arr: array) {
                    first = unwrapped
                } else {
                    break
                }
            } else if first == last {
                if let unwrapped = map[first] {
                    var list: [Pair] = unwrapped
                    for i in 0..<list.count {
                        var a: Pair = list[i]
                        if a.a == a.b {
                            for j in i+1..<list.count {
                                var b: Pair = list[j]
                                if b.a == b.b {
                                    if a.bi < b.bi {
                                        res.append([a.a, a.b, b.a, b.b])
                                        break
                                    }
                                } else {
                                    break
                                }
                            }
                            break
                        }
                    }
                }
                if let unwrapped = lowerKey(key: last, arr: array) {
                    last = unwrapped
                } else {
                    break
                }
                if let unwrapped = higherKey(key: first, arr: array) {
                    first = unwrapped
                } else {
                    break
                }
            } else {
                var lastA: Pair? = nil
                if let unwrappedFirst: [Pair] = map[first] {
                    for a: Pair in unwrappedFirst {
                        if a == lastA {
                            continue
                        }
                        lastA = a
                        var lastB: Pair? = nil
                        if let unwrappedLast: [Pair] = map[last] {
                            for b: Pair in unwrappedLast {
                                if a.bi < b.ai {
                                    if b == lastB {
                                        continue
                                    }
                                    lastB = b
                                    res.append([a.a, a.b, b.a, b.b])
                                }
                            }
                        }
                    }
                }
                if let unwrapped = lowerKey(key: last, arr: array) {
                    last = unwrapped
                } else {
                    break
                }
                if let unwrapped = higherKey(key: first, arr: array) {
                    first = unwrapped
                } else {
                    break
                }
            }
        }
        return res
    }
    class func lowerKey(# key: Int, arr: [Int]) -> Int? {
        if arr.count <= 0 {
            return nil;
        } else {
            for var i = arr.count - 1; i >= 0; i-- {
                if arr[i] < key {
                    return arr[i]
                }
            }
            return nil
        }
    }
    class func higherKey(# key: Int, arr: [Int]) -> Int? {
        if arr.count <= 0 {
            return nil;
        } else {
            for i in 0..<arr.count {
                if arr[i] > key {
                    return arr[i]
                }
            }
            return nil
        }
    }
}