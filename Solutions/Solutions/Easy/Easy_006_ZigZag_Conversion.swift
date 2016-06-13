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

Inspired by @dylan_yu at https://leetcode.com/discuss/10493/easy-to-understand-java-solution

*/

private extension String {
    /*
     Ref: http://oleb.net/blog/2014/07/swift-strings/
     "Because of the way Swift strings are stored, the String type does not support random access to its Characters via an integer index — there is no direct equivalent to NSStringʼs characterAtIndex: method. Conceptually, a String can be seen as a doubly linked list of characters rather than an array."
     
     By creating and storing a seperate array of the same sequence of characters,
     we could hopefully achieve amortized O(1) time for random access.
     */
    func randomAccessCharactersArray() -> [Character] {
        return Array(self.characters)
    }
}

struct Easy_006_ZigZag_Conversion {
    // t = O(N), s = O(N)
    static func convert(s  s: String, nRows: Int) -> String {
        var arr = Array<String>(count: nRows, repeatedValue: String())
        var i = 0
        let charArr = s.randomAccessCharactersArray()
        let len = charArr.count
        while i < len {
            var index = 0
            while index < nRows && i < len {
                arr[index].append(charArr[i])
                i += 1
                index += 1
            }
            index = nRows - 2
            while index > 0 && i < len {
                arr[index].append(charArr[i])
                i += 1
                index -= 1
            }
        }
        var res = String()
        for i in 0..<nRows {
            res += (arr[i])
        }
        return res
    }
}
