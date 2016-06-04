/*

https://leetcode.com/problems/multiply-strings/

#43 Multiply Strings

Level: medium

Given two numbers represented as strings, return multiplication of the numbers as a string.

Note: The numbers can be arbitrarily large and are non-negative.

Inspired by @ChiangKaiShrek at https://leetcode.com/discuss/26602/brief-c-solution-using-only-strings-and-without-reversal

*/

import Foundation

private extension String {
    subscript (index: Int) -> Character {
        return self[self.startIndex.advancedBy(index)]
    }
}

struct Medium_043_Multiply_Strings {
    static func multiply(num1  num1: String, num2: String) -> String {
        var sum = Array<Character>(count: num1.characters.count+num2.characters.count, repeatedValue: "0")
        for i in (0 ... num1.characters.count - 1).reverse() {
            var carry = 0
            var dict: [Character: Int] = [
                "0": 0,
                "1": 1,
                "2": 2,
                "3": 3,
                "4": 4,
                "5": 5,
                "6": 6,
                "7": 7,
                "8": 8,
                "9": 9,
            ]
            for j in (0 ... num2.characters.count - 1).reverse() {
                let tmp: Int = dict[sum[i + j + 1]]! + dict[num1[i]]! * dict[num2[j]]! + carry;
                sum[i + j + 1] = Character("\(tmp % 10)")
                carry = tmp / 10;
            }
            sum[i] = Character("\(dict[sum[i]]! + carry)")
        }
        for i in (0 ... sum.count - 1).reverse() {
            if sum[i] != "0" {
                return String(sum[0...i])
            }
        }
        return "0"
    }
}