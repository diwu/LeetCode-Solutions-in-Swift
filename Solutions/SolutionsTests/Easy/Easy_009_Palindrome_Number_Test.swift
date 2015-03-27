//
//  Easy_009_Palindrome_Number_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/27/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_009_Palindrome_Number_Test: XCTestCase {
    func test_001() {
        var v: Bool = Easy_009_Palindrome_Number.isPalindrome(-121)
        XCTAssert(v == false, "Easy_009_Palindrome_Number_Test")
    }
    func test_002() {
        var v: Bool = Easy_009_Palindrome_Number.isPalindrome(121)
        XCTAssert(v == true, "Easy_009_Palindrome_Number_Test")
    }
    func test_003() {
        var v: Bool = Easy_009_Palindrome_Number.isPalindrome(0)
        XCTAssert(v == true, "Easy_009_Palindrome_Number_Test")
    }
    func test_004() {
        var v: Bool = Easy_009_Palindrome_Number.isPalindrome(Int.max)
        XCTAssert(v == false, "Easy_009_Palindrome_Number_Test")
    }
    func test_005() {
        var v: Bool = Easy_009_Palindrome_Number.isPalindrome(Int.min)
        XCTAssert(v == false, "Easy_009_Palindrome_Number_Test")
    }
    func test_006() {
        var v: Bool = Easy_009_Palindrome_Number.isPalindrome(1999999999999999999)
        XCTAssert(v == false, "Easy_009_Palindrome_Number_Test")
    }
    func test_007() {
        var v: Bool = Easy_009_Palindrome_Number.isPalindrome(-1999999999999999999)
        XCTAssert(v == false, "Easy_009_Palindrome_Number_Test")
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
