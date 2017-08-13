//
//  Hard_072_Edit_Distance_Test.swift
//  Solutions
//
//  Created by Di Wu on 7/30/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Hard_072_Edit_Distance_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Hard_072_Edit_Distance"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [String] = ["horse", "ros"]
        let expected: Int = 3
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [String] = ["abcdxabcde", "abcdeabcdx"]
        let expected: Int = 2
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [String] = ["a", "b"]
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [String] = ["a", "a"]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [String] = ["", ""]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: [String] = ["a", "aa"]
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: [String] = ["b", "aa"]
        let expected: Int = 2
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        let input: [String] = ["ab", "a"]
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        let input: [String] = ["ab", "ba"]
        let expected: Int = 2
        asyncHelper(input: input, expected: expected)
    }
    func test_010() {
        let input: [String] = ["ros", "horse"]
        let expected: Int = 3
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [String], expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Hard_072_Edit_Distance_Test.TimeOutName)
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async(execute: { () -> Void in
            let result = Hard_072_Edit_Distance.minDistance(word1: input[0], word2: input[1])
            assertHelper(result == expected, problemName: Hard_072_Edit_Distance_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Hard_072_Edit_Distance_Test.TimeOut) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Hard_072_Edit_Distance_Test.ProblemName, input: input, resultValue: Hard_072_Edit_Distance_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
