//
//  Hard_032_Longest_Valid_Parentheses_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/11/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Hard_032_Longest_Valid_Parentheses_Test: XCTestCase, SolutionsTestCase {
    func test_001() {
        let input: String? = "(()"
        let expected: Int = 2
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: String? = nil
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: String? = ""
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: String? = "("
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: String? = ")()())"
        let expected: Int = 4
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: String? = "())())"
        let expected: Int = 2
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: String? = ")("
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        let input: String? = ")(((()))(()()("
        let expected: Int = 6
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: String?, expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result: Int = Hard_032_Longest_Valid_Parentheses.longestValidParentheses(input)
            assertHelper(expected == result, problemName:self.problemName(), input: input as Any, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout:timeOut()) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input as Any, resultValue:self.timeOutName(), expectedValue: expected)
            }
        }
    }
}
