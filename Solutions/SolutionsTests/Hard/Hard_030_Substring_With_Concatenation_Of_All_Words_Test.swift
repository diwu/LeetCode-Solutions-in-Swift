//
//  Hard_030_Substring_With_Concatenation_Of_All_Words_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/10/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Hard_030_Substring_With_Concatenation_Of_All_Words_Test: XCTestCase, SolutionsTestCase {
    func test_001() {
        let input: [Any?] = ["barfoothefoobarman", ["foo", "bar"]]
        let expected: Set<Int> = Set([0, 9])
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Any?] = ["axy01bb01xy", ["01", "xy"]]
        let expected: Set<Int> = Set([1, 7])
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Any?] = ["axy01bb01xy", ["0", "1", "x", "y"]]
        let expected: Set<Int> = Set([1, 7])
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [Any?] = ["axy01bb01xy", ["0"]]
        let expected: Set<Int> = Set([3, 7])
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [Any?] = ["__ABCDabcd__abcd_abcd_ABCD_", ["ABCD"]]
        let expected: Set<Int> = Set([2,22])
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: [Any?] = ["__ABCDabcd__abcd_abcd_ABCD_", ["ABCD", "abcd"]]
        let expected: Set<Int> = Set([2])
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: [Any?] = ["_ABCdefGHI___defGHIABC_ABCGHIde", ["def", "GHI", "ABC"]]
        let expected: Set<Int> = Set([1, 13])
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        let input: [Any?] = [nil, []]
        let expected: Set<Int> = Set([])
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        let input: [Any?] = ["", []]
        let expected: Set<Int> = Set([])
        asyncHelper(input: input, expected: expected)
    }
    func test_010() {
        let input: [Any?] = ["a", []]
        let expected: Set<Int> = Set([])
        asyncHelper(input: input, expected: expected)
    }
    func test_011() {
        let input: [Any?] = [nil, ["a"]]
        let expected: Set<Int> = Set([])
        asyncHelper(input: input, expected: expected)
    }
    func test_012() {
        let input: [Any?] = ["abcdabcdabcdabcdabcdabcd", ["abcdabcdabcd"]]
        let expected: Set<Int> = Set([0, 4, 8, 12])
        asyncHelper(input: input, expected: expected)
    }
    func test_013() {
        let input: [Any?] = ["abcdef", ["abcd", "bcde", "cdef"]]
        let expected: Set<Int> = Set([])
        asyncHelper(input: input, expected: expected)
    }
    func test_014() {
        let input: [Any?] = ["abcdefabcdcdefbcdeabcdcdef", ["abcd", "bcde", "cdef"]]
        let expected: Set<Int> = Set([6, 10, 14])
        asyncHelper(input: input, expected: expected)
    }
    func test_015() {
        let input: [Any?] = ["abcdefabcdcdefbcdeabcdcdef", ["abcd", "bcde", "cdef", "abcd"]]
        let expected: Set<Int> = Set([6])
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input ipt: [Any?], expected: Set<Int>) {
        var input = ipt
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result: [Int] = Hard_030_Substring_With_Concatenation_Of_All_Words.findSubstring(s: input[0] as! String?, words: input[1] as! [String])
            assertHelper(expected == Set(result), problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
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
