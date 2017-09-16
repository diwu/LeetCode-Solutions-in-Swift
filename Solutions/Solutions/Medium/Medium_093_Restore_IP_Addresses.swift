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

struct Medium_093_Restore_IP_Addresses {
    // t = O(1), s = O(1)
    static func restoreIpAddresses(_ s: String) -> [String] {
        let chars = [Character](s.characters)
        let len = chars.count
        guard len >= 4 else { return [] }
        var result = [String]()
        for i in 1...min(3, len-3) {
            for j in i...min(i+3, len-2) {
                for k in j...min(j+3, len-1) {
                    let s0 = String(chars[0..<i])
                    guard validate(s0) == true else { continue }
                    let s1 = String(chars[i..<j])
                    guard validate(s1) == true else { continue }
                    let s2 = String(chars[j..<k])
                    guard validate(s2) == true else { continue }
                    let s3 = String(chars[k..<len])
                    guard validate(s3) == true else { continue }
                    result.append("\(s0).\(s1).\(s2).\(s3)")
                }
            }
        }
        return result
    }
    static func validate(_ s: String) -> Bool {
        let chars = [Character](s)
        if chars.count > 1 && chars[0] == "0" { return false }
        let v = Int(s) ?? Int.max
        if v < 0 || v > 255 { return false }
        else { return true }
    }
}

