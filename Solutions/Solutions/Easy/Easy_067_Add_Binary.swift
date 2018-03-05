/*

https://leetcode.com/problems/add-binary/

#67 Add Binary

Given two binary strings, return their sum (also a binary string).

For example,
a = "11"
b = "1"
Return "100".

Inspired by @makuiyu at https://leetcode.com/discuss/25593/short-code-by-c

*/

import Foundation

private extension String {
    subscript (index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}

struct Easy_067_Add_Binary {
    static func addBinary(a: String, b: String) -> String {
        var s = ""
        var c: Int = 0
        var i = a.count - 1
        var j = b.count - 1
        let characterDict: [Character: Int] = [
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
        let intDict: [Int: String] = [
            0: "0",
            1: "1",
            2: "2",
            3: "3",
            4: "4",
            5: "5",
            6: "6",
            7: "7",
            8: "8",
            9: "9",
        ]
        while i >= 0 || j >= 0 || c == 1 {
            c += i >= 0 ? characterDict[a[i]]! : 0
            i -= 1
            c += j >= 0 ? characterDict[b[j]]! : 0
            j -= 1
            s = intDict[c%2]! + s
            c /= 2
        }
        return s
    }
}
