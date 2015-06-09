//
//  Hard_010_Regular_Expression_Matching_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/27/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Hard_010_Regular_Expression_Matching_Test: XCTestCase {
    private static let ProblemName: String = "Hard_010_Regular_Expression_Matching"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value * 10
    func test_001() {
        let input: [String] = ["aa", "a"]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [String] = ["aa", "aa"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [String] = ["aaa", "aa"]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [String] = ["aa", "a*"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [String] = ["aa", ".*"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: [String] = ["ab", ".*"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: [String] = ["aab", "c*a*b"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        let input: [String] = ["aaaaab", "c*a*b"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        let input: [String] = ["ab", "c*ab"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input  input: [String], expected: Bool) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Hard_010_Regular_Expression_Matching_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result = Hard_010_Regular_Expression_Matching.isMatch(s: input[0], p: input[1])
            assertHelper(result == expected, problemName: Hard_010_Regular_Expression_Matching_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Hard_010_Regular_Expression_Matching_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Hard_010_Regular_Expression_Matching_Test.ProblemName, input: input, resultValue: Hard_010_Regular_Expression_Matching_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}