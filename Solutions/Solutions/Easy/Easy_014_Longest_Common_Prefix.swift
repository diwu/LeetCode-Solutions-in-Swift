/*

https://leetcode.com/problems/longest-common-prefix/

#14 Longest Common Prefix

Level: easy

Write a function to find the longest common prefix string amongst an array of strings.

Inspired by @garysui at https://leetcode.com/discuss/15755/optimal-solution

*/

private extension String {
    subscript (i: Int) -> Character {
        let index: Index = advance(self.startIndex, i)
        return self[index]
    }
    subscript (intRange: Range<Int>) -> String {
        return self[advance(self.startIndex, intRange.startIndex) ..< advance(self.startIndex, intRange.endIndex)]
    }
}

class Easy_014_Longest_Common_Prefix {
    class func longestCommonPrefix( arr: [String]?) -> String {
        if let unwrapped = arr {
            if unwrapped.count == 0 {
                return ""
            } else {
                let stringLength: Int = unwrapped[0].characters.count
                for var i = 0; i < stringLength; i++ {
                    let c: Character = unwrapped[0][i]
                    let arrCount: Int = unwrapped.count
                    for var j = 1; j < arrCount; j++ {
                        if i == unwrapped[j].characters.count || unwrapped[j][i] != c {
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