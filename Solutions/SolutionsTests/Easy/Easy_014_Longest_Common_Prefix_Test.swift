//
//  Easy_014_Longest_Common_Prefix_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/30/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_014_Longest_Common_Prefix_Test: XCTestCase {

    let ProblemName: String = "Easy_014_Longest_Common_Prefix"

    func test_001() {
        var input: [String] = []
        var expected: String = ""
        var result: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(input)
        assertHelper(result == expected, problemName: ProblemName,input: input, resultValue: result, expectedValue: expected)
    }
    func test_002() {
        var input: [String] = ["a"]
        var expected: String = "a"
        var result: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(input)
        assertHelper(result == expected, problemName: ProblemName,input: input, resultValue: result, expectedValue: expected)
    }
    func test_003() {
        var input: [String] = ["a", "b"]
        var expected: String = ""
        var result: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(input)
        assertHelper(result == expected, problemName: ProblemName,input: input, resultValue: result, expectedValue: expected)
    }
    func test_004() {
        var input: [String] = ["a", "ab"]
        var expected: String = "a"
        var result: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(input)
        assertHelper(result == expected, problemName: ProblemName,input: input, resultValue: result, expectedValue: expected)
    }
    func test_005() {
        var input: [String] = ["a", "ab", ""]
        var expected: String = ""
        var result: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(input)
        assertHelper(result == expected, problemName: ProblemName,input: input, resultValue: result, expectedValue: expected)
    }
    func test_006() {
        var input: [String] = ["a", "ab", "c"]
        var expected: String = ""
        var result: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(input)
        assertHelper(result == expected, problemName: ProblemName,input: input, resultValue: result, expectedValue: expected)
    }
    func test_007() {
        var input: [String] = ["ab", "ab", "ab"]
        var expected: String = "ab"
        var result: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(input)
        assertHelper(result == expected, problemName: ProblemName,input: input, resultValue: result, expectedValue: expected)
    }
    func test_008() {
        var input: [String] = ["abc", "ab", "ab"]
        var expected: String = "ab"
        var result: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(input)
        assertHelper(result == expected, problemName: ProblemName,input: input, resultValue: result, expectedValue: expected)
    }
    func test_009() {
        var input: [String] = ["ab", "ab", "abc"]
        var expected: String = "ab"
        var result: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(input)
        assertHelper(result == expected, problemName: ProblemName,input: input, resultValue: result, expectedValue: expected)
    }
}