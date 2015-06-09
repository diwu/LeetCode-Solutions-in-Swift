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
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value

    func test_001() {
        let input: String = "()"
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }

    func test_002() {
        let input: String = ""
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }

    func test_003() {
        let input: String = "()[]{}"
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }

    func test_004() {
        let input: String = "(]"
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }

    func test_005() {
        let input: String = "([)]"
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }

    func asyncHelper(input  input: String, expected: Bool ) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Easy_020_Valid_Parentheses_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            let result: Bool = Easy_020_Valid_Parentheses.isValid(input)
            assertHelper(expected == result, problemName: Easy_020_Valid_Parentheses_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Easy_020_Valid_Parentheses_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Easy_020_Valid_Parentheses_Test.ProblemName, input: input, resultValue: Easy_020_Valid_Parentheses_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
