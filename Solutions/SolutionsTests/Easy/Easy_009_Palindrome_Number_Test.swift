//
//  Easy_009_Palindrome_Number_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/27/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_009_Palindrome_Number_Test: XCTestCase {

    let ProbleName: String = "Easy_009_Palindrome_Number"

    func test_001() {
        var input: Int = -121
        var expected: Bool = false
        var result = Easy_009_Palindrome_Number.isPalindrome(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_002() {
        var input: Int = 121
        var expected: Bool = true
        var result = Easy_009_Palindrome_Number.isPalindrome(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_003() {
        var input: Int = 0
        var expected: Bool = true
        var result = Easy_009_Palindrome_Number.isPalindrome(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_004() {
        var input: Int = Int.max
        var expected: Bool = false
        var result = Easy_009_Palindrome_Number.isPalindrome(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_005() {
        var input: Int = Int.min
        var expected: Bool = false
        var result = Easy_009_Palindrome_Number.isPalindrome(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_006() {
        var input: Int = 1999999999999999999
        var expected: Bool = false
        var result = Easy_009_Palindrome_Number.isPalindrome(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_007() {
        var input: Int = -1999999999999999999
        var expected: Bool = false
        var result = Easy_009_Palindrome_Number.isPalindrome(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
}

/*
isPalindrome(-121)                  //false
isPalindrome(121)                   //true
isPalindrome(0)                     //true
isPalindrome(Int.max)               //false
isPalindrome(Int.min)               //false
isPalindrome(1999999999999999999)   //false, overflow handling
isPalindrome(-1999999999999999999)  //false, overflow handling
*/
