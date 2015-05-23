//
//  Hard_044_Wildcard_Matching_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/23/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Hard_044_Wildcard_Matching_Test: XCTestCase {
    private static let ProblemName: String = "Hard_044_Wildcard_Matching"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value * 10
    func test_001() {
        var input: [String] = ["aa", "a"]
        var expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        var input: [String] = ["aa", "aa"]
        var expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        var input: [String] = ["aaa", "aa"]
        var expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        var input: [String] = ["aa", "a*"]
        var expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        var input: [String] = ["aa", "?*"]
        var expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        var input: [String] = ["ab", "?*"]
        var expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        var input: [String] = ["aab", "c*a*b"]
        var expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        var input: [String] = ["aaaaab", "c*a*b"]
        var expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        var input: [String] = ["ab", "c*ab"]
        var expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_010() {
        var input: [String] = ["aa", "*"]
        var expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(# input: [String], expected: Bool) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Hard_044_Wildcard_Matching_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result = Hard_044_Wildcard_Matching.isMatch(s: input[0], p: input[1])
            assertHelper(result == expected, problemName: Hard_044_Wildcard_Matching_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Hard_044_Wildcard_Matching_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Hard_044_Wildcard_Matching_Test.ProblemName, input: input, resultValue: Hard_044_Wildcard_Matching_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
