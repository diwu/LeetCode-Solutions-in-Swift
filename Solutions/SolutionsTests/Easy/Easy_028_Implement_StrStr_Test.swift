//
//  Easy_028_Implement_StrStr_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/9/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_028_Implement_StrStr_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Easy_028_Implement_StrStr"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [Any?] = ["abc", "a"]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Any?] = [nil, nil]
        let expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Any?] = ["a", nil]
        let expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [Any?] = [nil, "a"]
        let expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [Any?] = ["abc", "d"]
        let expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: [Any?] = ["abc", "b"]
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: [Any?] = ["abcdebcdebcdebc", "de"]
        let expected: Int = 3
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        let input: [Any?] = ["bcd", "bcde"]
        let expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        let input: [Any?] = ["bcd", "abcd"]
        let expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_010() {
        let input: [Any?] = ["", ""]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_011() {
        let input: [Any?] = ["a", ""]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_012() {
        let input: [Any?] = ["", "a"]
        let expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_013() {
        let input: [Any?] = ["mississippi", "issispi"]
        let expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input ipt: [Any?], expected: Int) {
        var input = ipt
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result_brute_force: Int = Easy_028_Implement_StrStr.strStr_brute_force(hayStack: input[0] as! String?, needle: input[1] as! String?)
            let result_KMP: Int = Easy_028_Implement_StrStr.strStr_KMP(hayStack: input[0] as! String?, needle: input[1] as! String?)
            assertHelper(expected == result_brute_force && result_brute_force == result_KMP, problemName:self.problemName(), input: input, resultValue: ["brute force: \(result_brute_force)", "KMP: \(result_KMP)"], expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout:timeOut()) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input, resultValue:self.timeOutName(), expectedValue: expected)
            }
        }
    }
}
