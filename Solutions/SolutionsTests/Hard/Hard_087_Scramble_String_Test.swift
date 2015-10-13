//
//  Hard_087_Scramble_String_Test.swift
//  Solutions
//
//  Created by Di Wu on 10/13/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Hard_087_Scramble_String_Test: XCTestCase {
    private static let ProblemName: String = "Hard_087_Scramble_String"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [String?] = ["rgtae", "great"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [String?] = ["rgtaex", "great"]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [String?] = ["abc", "abcd"]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [String?] = [nil, "abcd"]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [String?] = ["", "abcd"]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: [String?] = ["bacd", "abcd"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: [String?] = ["aaaa", "aaaa"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        let input: [String?] = ["ABCDE", "CAEBD"]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        let input: [String?] = ["abb", "bab"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input input: [String?], expected: Bool) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Hard_087_Scramble_String_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            let result_recursion = Hard_087_Scramble_String.isScramble_recursion(s1: input[0], s2: input[1])
            let result_iteration = Hard_087_Scramble_String.isScramble_iteration(s1: input[0], s2: input[1])
            assertHelper(result_recursion == expected && result_iteration == expected, problemName: Hard_087_Scramble_String_Test.ProblemName, input: input, resultValue: result_recursion, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Hard_087_Scramble_String_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Hard_087_Scramble_String_Test.ProblemName, input: input, resultValue: Hard_087_Scramble_String_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
