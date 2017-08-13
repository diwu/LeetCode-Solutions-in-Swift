//
//  Easy_014_Longest_Common_Prefix_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/30/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_014_Longest_Common_Prefix_Test: XCTestCase, SolutionsTestCase {

    let ProblemName: String = "Easy_014_Longest_Common_Prefix"

    func test_001() {
        let input: [String] = []
        let expected: String = ""
        let result: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(input)
        assertHelper(result == expected, problemName: ProblemName,input: input, resultValue: result, expectedValue: expected)
    }
    func test_002() {
        let input: [String] = ["a"]
        let expected: String = "a"
        let result: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(input)
        assertHelper(result == expected, problemName: ProblemName,input: input, resultValue: result, expectedValue: expected)
    }
    func test_003() {
        let input: [String] = ["a", "b"]
        let expected: String = ""
        let result: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(input)
        assertHelper(result == expected, problemName: ProblemName,input: input, resultValue: result, expectedValue: expected)
    }
    func test_004() {
        let input: [String] = ["a", "ab"]
        let expected: String = "a"
        let result: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(input)
        assertHelper(result == expected, problemName: ProblemName,input: input, resultValue: result, expectedValue: expected)
    }
    func test_005() {
        let input: [String] = ["a", "ab", ""]
        let expected: String = ""
        let result: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(input)
        assertHelper(result == expected, problemName: ProblemName,input: input, resultValue: result, expectedValue: expected)
    }
    func test_006() {
        let input: [String] = ["a", "ab", "c"]
        let expected: String = ""
        let result: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(input)
        assertHelper(result == expected, problemName: ProblemName,input: input, resultValue: result, expectedValue: expected)
    }
    func test_007() {
        let input: [String] = ["ab", "ab", "ab"]
        let expected: String = "ab"
        let result: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(input)
        assertHelper(result == expected, problemName: ProblemName,input: input, resultValue: result, expectedValue: expected)
    }
    func test_008() {
        let input: [String] = ["abc", "ab", "ab"]
        let expected: String = "ab"
        let result: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(input)
        assertHelper(result == expected, problemName: ProblemName,input: input, resultValue: result, expectedValue: expected)
    }
    func test_009() {
        let input: [String] = ["ab", "ab", "abc"]
        let expected: String = "ab"
        let result: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(input)
        assertHelper(result == expected, problemName: ProblemName,input: input, resultValue: result, expectedValue: expected)
    }
}
