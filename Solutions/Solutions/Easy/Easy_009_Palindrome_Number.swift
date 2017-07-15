/*

https://oj.leetcode.com/problems/palindrome-number/

#9 Palindrome Number

Level: easy

Determine whether an integer is a palindrome. Do this without extra space.

Some hints:

Could negative integers be palindromes? (ie, -1)

If you are thinking of converting the integer to string, note the restriction of using extra space.

You could also try reversing an integer. However, if you have solved the problem "Reverse Integer", you know that the reversed integer might overflow. How would you handle such case?

There is a more generic way of solving this problem.

Inspired by @hln9319 https://leetcode.com/discuss/12693/neat-ac-java-code-o-n-time-complexity

*/

struct Easy_009_Palindrome_Number {
    // O (N)
    static func isPalindrome(_ x: Int) -> Bool {
        guard x != Int.min else {
            return false;
        }
        var tmp = abs(x)
        let reference = abs(x)
        var candidate = 0
        while tmp > 0 {
            if candidate > Int.max / 10 {
                return false
            }
            candidate = candidate * 10 + tmp % 10
            tmp = tmp / 10
        }
        return (candidate == reference)
    }
}
