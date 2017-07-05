/*

https://leetcode.com/problems/restore-ip-addresses/

#93 Restore IP Addresses

Level: medium

Given a string containing only digits, restore it by returning all possible valid IP address combinations.

For example:
Given "25525511135",

return ["255.255.11.135", "255.255.111.35"]. (Order does not matter)

Inspired by @fiona_mao at https://leetcode.com/discuss/12790/my-code-in-java

*/

import Foundation

private extension String {
    subscript (range: Range<Int>) -> String {
        return String(self[self.characters.index(self.startIndex, offsetBy: range.lowerBound)..<self.characters.index(self.startIndex, offsetBy: range.upperBound, limitedBy: self.endIndex)!])
    }
}

struct Medium_093_Restore_IP_Addresses {
    // t = O(1), s = O(1)
    static func restoreIpAddresses(_ s: String) -> [String] {
        var res = Array<String>()
        let len: Int = s.characters.count
        for i in 1 ..< min(4, len - 2) {
            for j in i + 1 ..< min(i+4, len-1) {
                for k in j + 1 ..< min(j + 4, len) {
                    let s0: String = s[0..<i]
                    let s1: String = s[i..<j]
                    let s2: String = s[j..<k]
                    let s3: String = s[k..<len]
                    if isValid(s0) && isValid(s1) && isValid(s2) && isValid(s3) {
                        res.append("\(s0).\(s1).\(s2).\(s3)")
                    }
                }
            }
        }
        return res
    }
    private static func isValid(_ s: String) -> Bool {
        if s.characters.count > 3 {
            return false
        }
        if s.characters.count == 0 {
            return false
        }
        if s.characters.count > 1 && s.characters.first == "0" {
            return false
        }
        if Int(s)! > 255 {
            return false
        }
        return true
    }
}
