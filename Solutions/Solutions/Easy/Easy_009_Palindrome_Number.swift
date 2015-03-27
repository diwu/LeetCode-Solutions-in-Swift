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

Inspired by @hln9319 https://oj.leetcode.com/discuss/12693/neat-ac-java-code-o-n-time-complexity

*/

class Easy_009_Palindrome_Number {
    // O (N)
    class func isPalindrome(x: Int) -> Bool {
        var palindromeX: Int = 0
        var inputX: Int = x
        var tmp: Int = x
        while tmp > 0 {
            if palindromeX >= Int.max / 10 {
                return false
            }
            palindromeX = palindromeX * 10 + tmp % 10
            tmp = tmp / 10
        }
        return palindromeX == inputX
    }
}