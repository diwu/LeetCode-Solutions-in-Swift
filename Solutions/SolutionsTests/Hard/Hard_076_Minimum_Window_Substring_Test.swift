//
//  Hard_076_Minimum_Window_Substring_Test.swift
//  Solutions
//
//  Created by Di Wu on 7/30/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Hard_076_Minimum_Window_Substring_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Hard_076_Minimum_Window_Substring"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value * 10
    func test_001() {
        let input: [String] = ["ADOBECODEBANC", "ABC"]
        let expected: String = "BANC"
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [String] = ["aa", "aa"]
        let expected: String = "aa"
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [String] = ["TTTTTTTE", "TE"]
        let expected: String = "TE"
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [String] = ["abcdefghijklmnopqrst_z_bcdefghijklmnopqrst", "abcdefghijklmnopqrstz"]
        let expected: String = "abcdefghijklmnopqrst_z"
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [String] = ["abcdefghijklmnopqrst__z_abcdefghijklmnopqrst", "abcdefghijklmnopqrstz"]
        let expected: String = "z_abcdefghijklmnopqrst"
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: [String] = ["bcdefghijklmnopqrst_z_abcdefghijklmnopqrst", "abcdefghijklmnopqrstz"]
        let expected: String = "z_abcdefghijklmnopqrst"
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: [String] = ["bcdefghijklmnopqrst_z_abcdefghijklmnopqrst", "at"]
        let expected: String = "t_z_a"
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [String], expected: String) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Hard_076_Minimum_Window_Substring_Test.TimeOutName)
        serialQueue().async(execute: { () -> Void in
            let result = Hard_076_Minimum_Window_Substring.minWindow(s: input[0], t: input[1])
            assertHelper(result == expected, problemName: Hard_076_Minimum_Window_Substring_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Hard_076_Minimum_Window_Substring_Test.TimeOut) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Hard_076_Minimum_Window_Substring_Test.ProblemName, input: input, resultValue: Hard_076_Minimum_Window_Substring_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
