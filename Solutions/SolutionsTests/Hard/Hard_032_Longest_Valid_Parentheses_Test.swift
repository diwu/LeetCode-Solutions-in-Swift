//
//  Hard_032_Longest_Valid_Parentheses_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/11/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Hard_032_Longest_Valid_Parentheses_Test: XCTestCase {
    private static let ProblemName: String = "Hard_032_Longest_Valid_Parentheses"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
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
    private func asyncHelper(input  input: String?, expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Hard_032_Longest_Valid_Parentheses_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            let result: Int = Hard_032_Longest_Valid_Parentheses.longestValidParentheses(input)
            assertHelper(expected == result, problemName: Hard_032_Longest_Valid_Parentheses_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Hard_032_Longest_Valid_Parentheses_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Hard_032_Longest_Valid_Parentheses_Test.ProblemName, input: input, resultValue: Hard_032_Longest_Valid_Parentheses_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
