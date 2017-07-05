/*

https://leetcode.com/problems/longest-common-prefix/

#14 Longest Common Prefix

Level: easy

Write a function to find the longest common prefix string amongst an array of strings.

Inspired by @garysui at https://leetcode.com/discuss/15755/optimal-solution

*/

private extension String {
    subscript (i: Int) -> Character {
        let index: Index = self.characters.index(self.startIndex, offsetBy: i)
        return self[index]
    }
    subscript (range: Range<Int>) -> String {
        return String(self[self.characters.index(self.startIndex, offsetBy: range.lowerBound)..<self.characters.index(self.startIndex, offsetBy: range.upperBound)])
    }
}

class Easy_014_Longest_Common_Prefix {
    class func longestCommonPrefix( _ arr: [String]?) -> String {
        if let unwrapped = arr {
            if unwrapped.count == 0 {
                return ""
            } else {
                let stringLength: Int = unwrapped[0].characters.count
                for i in 0 ..< stringLength {
                    let c: Character = unwrapped[0][i]
                    let arrCount: Int = unwrapped.count
                    for j in 1 ..< arrCount {
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
