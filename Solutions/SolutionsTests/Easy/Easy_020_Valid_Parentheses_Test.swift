//
//  Easy_020_Valid_Parentheses_Test.swift
//  Solutions
//
//  Created by Di Wu on 4/22/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_020_Valid_Parentheses_Test: XCTestCase {

    private static let ProblemName: String = "Easy_020_Valid_Parentheses"
    private static let TimeOutName = ProblemName + " Time Out"
    private static let TimeOut = 0.001

    func test_001() {
        var input: String = "()"
        var expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }

    func test_002() {
        var input: String = ""
        var expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }

    func test_003() {
        var input: String = "()[]{}"
        var expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }

    func test_004() {
        var input: String = "(]"
        var expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }

    func test_005() {
        var input: String = "([)]"
        var expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }

    func asyncHelper(# input: String, expected: Bool ) {
        var expectation: XCTestExpectation = self.expectationWithDescription(Easy_020_Valid_Parentheses_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result: Bool = Easy_020_Valid_Parentheses.isValid(input)
            assertHelper(expected == result, problemName: Easy_020_Valid_Parentheses_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            expectation.fulfill()
        })
        waitForExpectationsWithTimeout(Easy_020_Valid_Parentheses_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Easy_020_Valid_Parentheses_Test.ProblemName, input: input, resultValue: Easy_020_Valid_Parentheses_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
