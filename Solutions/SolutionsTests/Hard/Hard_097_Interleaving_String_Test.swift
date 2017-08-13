//
//  Hard_097_Interleaving_String_Test.swift
//  Solutions
//
//  Created by Di Wu on 12/8/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Hard_097_Interleaving_String_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Hard_097_Interleaving_String"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [String] = ["aabcc", "dbbca", "aadbbcbcac"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [String] = ["aabcc", "dbbca", "aadbbbaccc"]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [String] = ["abc", "1", "1abc"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [String] = ["1", "abc", "a1bc"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [String] = ["1", "abc", "b1ac"]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: [String] = ["abc", "12", "1abc2"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: [String] = ["12", "abc", "a12bc"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        let input: [String] = ["12", "abc", "b1a2c"]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        let input: [String] = ["abc", "123456", "12a3b4c56"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_010() {
        let input: [String] = ["123456", "abc", "a12b3456c"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_011() {
        let input: [String] = ["123456", "abc", "b1a2345c6"]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [String], expected: Bool) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Hard_097_Interleaving_String_Test.TimeOutName)
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async(execute: { () -> Void in
            let result_swift = Hard_097_Interleaving_String.isInterleave(s1: input[0], s2: input[1], s3: input[2])
            let result_objc = ObjC_Hard_097_Interleaving_String.isInterleave(withS1: input[0], s2: input[1], s3: input[2])
            assertHelper(result_swift == expected, problemName: Hard_097_Interleaving_String_Test.ProblemName, input: input, resultValue: result_swift, expectedValue: expected)
            assertHelper(result_objc == expected, problemName: Hard_097_Interleaving_String_Test.ProblemName, input: input, resultValue: result_objc, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Hard_097_Interleaving_String_Test.TimeOut) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Hard_097_Interleaving_String_Test.ProblemName, input: input, resultValue: Hard_097_Interleaving_String_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
