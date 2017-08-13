//
//  Hard_065_Valid_Number_Test.swift
//  Solutions
//
//  Created by Di Wu on 7/14/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Hard_065_Valid_Number_Test: XCTestCase, SolutionsTestCase {
    func test_001() {
        let input: String = "+1"
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: String = "-23432"
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: String = "123"
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: String = "+2.4e+12"
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: String = "3e9"
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: String = "1."
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: String = "-42."
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        let input: String = "0."
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        let input: String = ".0"
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_010() {
        let input: String = "."
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_011() {
        let input: String = "+12.23"
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_012() {
        let input: String = "87."
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_013() {
        let input: String = "132"
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_014() {
        let input: String = "+ 1"
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_015() {
        let input: String = "-23+432"
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_016() {
        let input: String = "e123"
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_017() {
        let input: String = "+2.4e+1.2"
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_018() {
        let input: String = "3ee9"
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_019() {
        let input: String = "1.."
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_020() {
        let input: String = " --42."
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_021() {
        let input: String = "0.a"
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_022() {
        let input: String = "b.0"
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_023() {
        let input: String = ".e"
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_024() {
        let input: String = " +12.23  "
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_025() {
        let input: String = "87.b"
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_026() {
        let input: String = "13 2"
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: String, expected: Bool) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result = Hard_065_Valid_Number.isNumber(input)
            assertHelper(result == expected, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
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
