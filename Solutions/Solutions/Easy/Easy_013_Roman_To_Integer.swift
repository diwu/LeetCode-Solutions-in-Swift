/*

https://leetcode.com/problems/roman-to-integer/

#13 Roman To Integer

Level: easy

Given a roman numeral, convert it to an integer.

Input is guaranteed to be within the range from 1 to 3999.

Inspired by @makeittrue at https://leetcode.com/discuss/2369/solution-for-this-question-but-dont-know-there-any-easier-way

*/

private extension String {
    subscript (index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}

class Easy_013_Roman_To_Integer {
    // O (N)
    // One pass
    class func romanToInt(s: String) -> Int {
        var result: Int = 0
        let length: Int = s.count
        for i in (0...length-1).reversed() {
            let c: Character = s[i]
            switch c {
            case "I":
                result += result >= 5 ? -1 : 1
            case "V":
                result += 5
            case "X":
                result += 10 * (result >= 50 ? -1 : 1)
            case "L":
                result += 50
            case "C":
                result += 100 * (result >= 500 ? -1 : 1)
            case "D":
                result += 500
            case "M":
                result += 1000
            default:
                break
            }
        }
        return result
    }
}
