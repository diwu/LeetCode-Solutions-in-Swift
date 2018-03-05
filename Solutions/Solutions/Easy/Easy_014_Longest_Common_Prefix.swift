/*

https://leetcode.com/problems/longest-common-prefix/

#14 Longest Common Prefix

Level: easy

Write a function to find the longest common prefix string amongst an array of strings.

Inspired by @garysui at https://leetcode.com/discuss/15755/optimal-solution

*/

private extension String {
    subscript(intIndex: Int) -> Character {
        let index = self.index(self.startIndex, offsetBy: intIndex)
        return self[index]
    }
    subscript(range: Range<Int>) -> String {
        let lowerBoundIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
        let upperBoundIndex = self.index(self.startIndex, offsetBy: range.upperBound)
        let rangeInStringIndex = lowerBoundIndex ..< upperBoundIndex
        let stringSlice = self[rangeInStringIndex]
        return String(stringSlice)
    }
}

struct Easy_014_Longest_Common_Prefix {
    // t = O(N*M), s = O(1)
    static func longestCommonPrefix(_ input: [String]?) -> String {
        guard let arr = input else {
            return ""
        }
        guard arr.count > 0 else {
            return ""
        }
        let len = arr[0].count
        let arrLen = arr.count
        for i in 0 ..< len {
            let char = arr[0][i]
            for j in 1 ..< arrLen {
                if i == arr[j].count || char != arr[j][i] {
                    return arr[0][0 ..< i]
                }
            }
        }
        return arr[0]
    }
}
