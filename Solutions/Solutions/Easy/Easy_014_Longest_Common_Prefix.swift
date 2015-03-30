/*

https://leetcode.com/problems/longest-common-prefix/

#14 Longest Common Prefix

Level: easy

Write a function to find the longest common prefix string amongst an array of strings.

Inspired by @garysui at https://leetcode.com/discuss/15755/optimal-solution

*/

private extension String {
    subscript (i: Int) -> Character {
        var index: Index = advance(self.startIndex, i)
        return self[index]
    }
    subscript (intRange: Range<Int>) -> String {
        return self[advance(self.startIndex, intRange.startIndex) ..< advance(self.startIndex, intRange.endIndex)]
    }
}

class Easy_014_Longest_Common_Prefix {
    class func longestCommonPrefix( arr: [String]?) -> String {
        if let unwrapped = arr {
            if count(unwrapped) == 0 {
                return ""
            } else {
                var stringLength: Int = count(unwrapped[0])
                for var i = 0; i < stringLength; i++ {
                    var c: Character = unwrapped[0][i]
                    var arrCount: Int = count(unwrapped)
                    for var j = 1; j < arrCount; j++ {
                        if i == count(unwrapped[j]) || unwrapped[j][i] != c {
                            return unwrapped[0][0..<i]
                        }
                    }
                }
                return unwrapped[0]
            }
        } else {
            return ""
        }
    }
}