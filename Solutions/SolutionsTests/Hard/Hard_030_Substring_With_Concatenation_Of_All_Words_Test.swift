//
//  Hard_030_Substring_With_Concatenation_Of_All_Words_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/10/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Hard_030_Substring_With_Concatenation_Of_All_Words_Test: XCTestCase {
    private static let ProblemName: String = "Hard_030_Substring_With_Concatenation_Of_All_Words"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        var input: [Any?] = ["barfoothefoobarman", ["foo", "bar"]]
        var expected: Set<Int> = Set([0, 9])
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        var input: [Any?] = ["axy01bb01xy", ["01", "xy"]]
        var expected: Set<Int> = Set([1, 7])
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        var input: [Any?] = ["axy01bb01xy", ["0", "1", "x", "y"]]
        var expected: Set<Int> = Set([1, 7])
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        var input: [Any?] = ["axy01bb01xy", ["0"]]
        var expected: Set<Int> = Set([3, 7])
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        var input: [Any?] = ["__ABCDabcd__abcd_abcd_ABCD_", ["ABCD"]]
        var expected: Set<Int> = Set([2,22])
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        var input: [Any?] = ["__ABCDabcd__abcd_abcd_ABCD_", ["ABCD", "abcd"]]
        var expected: Set<Int> = Set([2])
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        var input: [Any?] = ["_ABCdefGHI___defGHIABC_ABCGHIde", ["def", "GHI", "ABC"]]
        var expected: Set<Int> = Set([1, 13])
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        var input: [Any?] = [nil, []]
        var expected: Set<Int> = Set([])
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        var input: [Any?] = ["", []]
        var expected: Set<Int> = Set([])
        asyncHelper(input: input, expected: expected)
    }
    func test_010() {
        var input: [Any?] = ["a", []]
        var expected: Set<Int> = Set([])
        asyncHelper(input: input, expected: expected)
    }
    func test_011() {
        var input: [Any?] = [nil, ["a"]]
        var expected: Set<Int> = Set([])
        asyncHelper(input: input, expected: expected)
    }
    func test_012() {
        var input: [Any?] = ["abcdabcdabcdabcdabcdabcd", ["abcdabcdabcd"]]
        var expected: Set<Int> = Set([0, 4, 8, 12])
        asyncHelper(input: input, expected: expected)
    }
    func test_013() {
        var input: [Any?] = ["abcdef", ["abcd", "bcde", "cdef"]]
        var expected: Set<Int> = Set([])
        asyncHelper(input: input, expected: expected)
    }
    func test_014() {
        var input: [Any?] = ["abcdefabcdcdefbcdeabcdcdef", ["abcd", "bcde", "cdef"]]
        var expected: Set<Int> = Set([6, 10, 14])
        asyncHelper(input: input, expected: expected)
    }
    func test_015() {
        var input: [Any?] = ["abcdefabcdcdefbcdeabcdcdef", ["abcd", "bcde", "cdef", "abcd"]]
        var expected: Set<Int> = Set([6])
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(var # input: [Any?], expected: Set<Int>) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Hard_030_Substring_With_Concatenation_Of_All_Words_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result: [Int] = Hard_030_Substring_With_Concatenation_Of_All_Words.findSubstring(s: input[0] as! String?, words: input[1] as! [String])
            assertHelper(expected == Set(result), problemName: Hard_030_Substring_With_Concatenation_Of_All_Words_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Hard_030_Substring_With_Concatenation_Of_All_Words_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Hard_030_Substring_With_Concatenation_Of_All_Words_Test.ProblemName, input: input, resultValue: Hard_030_Substring_With_Concatenation_Of_All_Words_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
