/*

https://oj.leetcode.com/problems/zigzag-conversion/

#6 ZigZag Conversion

Level: easy

The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

P   A   H   N
A P L S I I G
Y   I   R

And then read line by line: "PAHNAPLSIIGYIR"

Write the code that will take a string and make this conversion given a number of rows:

string convert(string text, int nRows);

convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".

Inspired by @dylan_yu at https://oj.leetcode.com/discuss/10493/easy-to-understand-java-solution

*/

// Helper
private extension String {
    subscript (index: Int) -> Character {
        return self[advance(self.startIndex, index)]
    }
}

class Easy_006_ZigZag_Conversion {
    // O (N)
    class func convert(s  s: String, nRows: Int) -> String {
        var arr = Array<String>(count: nRows, repeatedValue: String())
        var i = 0, len = s.characters.count
        while i < len {
            for var index = 0; index < nRows && i < len; index++ {
                arr[index].append(s[i++])
            }
            for var index = nRows - 2; index > 0 && i < len; index-- {
                arr[index].append(s[i++])
            }
        }
        var res = String()
        for i in 0..<nRows {
            res.extend(arr[i])
        }
        return res
    }
}
