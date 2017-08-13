//
//  Easy_009_Palindrome_Number_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/27/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_009_Palindrome_Number_Test: XCTestCase, SolutionsTestCase {


    func test_001() {
        let input: Int = -121
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: Int = 121
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: Int = 0
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: Int = Int.max
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: Int = Int.min
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: Int = 1999999999999999999
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: Int = -1999999999999999999
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        let input: Int = Int.min
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        let input: Int = Int.max
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func asyncHelper(input: Int, expected: Bool ) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result: Bool = Easy_009_Palindrome_Number.isPalindrome(input)
            assertHelper(result == expected, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout:timeOut()) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input, resultValue:self.timeOutName(), expectedValue: expected)
            }
        }
    }
}
