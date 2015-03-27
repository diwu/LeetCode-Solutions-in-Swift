//
//  Hard_004_Median_Of_Two_Sorted_Arrays.swift
//  Solutions
//
//  Created by Wu, Di on 3/27/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

class Hard_004_Median_Of_Two_Sorted_Arrays {
    // O (log(min(m, n)))
    class func median2(a: [Int], b: [Int]) -> Double {
        var m = count(a)
        var n = count(b)

        if m > n {
            return median2(b, b: a)
        }

        var iMin = 0, iMax = m
        while iMin <= iMax {
            var i = (iMin + iMax) >> 1
            var j = ((m + n + 1) >> 1) - i
            if j > 0 && i < m && b[j-1] > a[i] {
                iMin = i + 1
            } else if i > 0 && j < n && a[i-1] > b[j] {
                iMax = i - 1
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