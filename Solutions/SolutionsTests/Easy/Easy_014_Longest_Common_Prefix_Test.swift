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
        var arr: [String] = []
        var lcp: String = ""
        var v: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(arr)
        assertHelper(v == lcp, problemName: ProblemName,input: arr, resultValue: v, expectedValue: lcp)
    }
    func test_002() {
        var arr: [String] = ["a"]
        var lcp: String = "a"
        var v: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(arr)
        assertHelper(v == lcp, problemName: ProblemName,input: arr, resultValue: v, expectedValue: lcp)
    }
    func test_003() {
        var arr: [String] = ["a", "b"]
        var lcp: String = ""
        var v: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(arr)
        assertHelper(v == lcp, problemName: ProblemName,input: arr, resultValue: v, expectedValue: lcp)
    }
    func test_004() {
        var arr: [String] = ["a", "ab"]
        var lcp: String = "a"
        var v: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(arr)
        assertHelper(v == lcp, problemName: ProblemName,input: arr, resultValue: v, expectedValue: lcp)
    }
    func test_005() {
        var arr: [String] = ["a", "ab", ""]
        var lcp: String = ""
        var v: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(arr)
        assertHelper(v == lcp, problemName: ProblemName,input: arr, resultValue: v, expectedValue: lcp)
    }
    func test_006() {
        var arr: [String] = ["a", "ab", "c"]
        var lcp: String = ""
        var v: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(arr)
        assertHelper(v == lcp, problemName: ProblemName,input: arr, resultValue: v, expectedValue: lcp)
    }
    func test_007() {
        var arr: [String] = ["ab", "ab", "ab"]
        var lcp: String = "ab"
        var v: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(arr)
        assertHelper(v == lcp, problemName: ProblemName,input: arr, resultValue: v, expectedValue: lcp)
    }
    func test_008() {
        var arr: [String] = ["abc", "ab", "ab"]
        var lcp: String = "ab"
        var v: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(arr)
        assertHelper(v == lcp, problemName: ProblemName,input: arr, resultValue: v, expectedValue: lcp)
    }
    func test_009() {
        var arr: [String] = ["ab", "ab", "abc"]
        var lcp: String = "ab"
        var v: String = Easy_014_Longest_Common_Prefix.longestCommonPrefix(arr)
        assertHelper(v == lcp, problemName: ProblemName,input: arr, resultValue: v, expectedValue: lcp)
    }
}