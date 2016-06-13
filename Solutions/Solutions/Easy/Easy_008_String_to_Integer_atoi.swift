/*

https://oj.leetcode.com/problems/string-to-integer-atoi/

#8 String to Integer (atoi)

Level: easy

Implement atoi to convert a string to an integer.

Hint: Carefully consider all possible input cases. If you want a challenge, please do not see below and ask yourself what are the possible input cases.

Notes: It is intended for this problem to be specified vaguely (ie, no given input specs). You are responsible to gather all the input requirements up front.

Update (2015-02-10):
The signature of the C++ function had been updated. If you still see your function signature accepts a const char * argument, please click the reload button  to reset your code definition.

Requirements for atoi:
The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.

The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.

If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.

If no valid conversion could be performed, a zero value is returned. If the correct value is out of the range of representable values, INT_MAX (2147483647) or INT_MIN (-2147483648) is returned.

Inspired by @yuruofeifei at https://leetcode.com/discuss/8886/my-simple-solution

*/

struct Easy_008_String_to_Integer_atoi {
    // t = O(N), s = O(1)
    static func atoi(s: String) -> Int {
        var positive = true
        var base = 0
        for char in s.characters {
            guard char != "+" else {
                continue
            }
            guard char != " " else {
                continue
            }
            guard char != "-" else {
                if base == 0 {
                    positive = false
                }
                continue
            }
            guard let intValue = Int(String(char)) else {
                continue
            }
            guard base < Int.max / 10 || (base == Int.max / 10 && intValue <= Int.max % 10) else {
                if positive {
                    return Int.max
                } else {
                    return Int.min
                }
            }
            base = intValue + 10 * base
        }
        if positive {
            return base
        } else {
            return 0 - base
        }
    }
}