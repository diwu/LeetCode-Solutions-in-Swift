//
//  Medium_005_Longest_Palindromic_Substring_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/27/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_005_Longest_Palindromic_Substring_Test: XCTestCase {
    func testCase001() {
        var v = Medium_005_Longest_Palindromic_Substring.longest("a")
        XCTAssert(v == "a", "Medium_005_Longest_Palindromic_Substring_Test #1")
    }
    func testCase002() {
        var v = Medium_005_Longest_Palindromic_Substring.longest("aab")
        XCTAssert(v == "aa", "Medium_005_Longest_Palindromic_Substring_Test #2")
    }
    func testCase003() {
        var v = Medium_005_Longest_Palindromic_Substring.longest("abb")
        XCTAssert(v == "bb", "Medium_005_Longest_Palindromic_Substring_Test #3")
    }
    func testCase004() {
        var v = Medium_005_Longest_Palindromic_Substring.longest("abbc")
        XCTAssert(v == "bb", "Medium_005_Longest_Palindromic_Substring_Test #4")
    }
    func testCase005() {
        var v = Medium_005_Longest_Palindromic_Substring.longest("abbaaac")
        XCTAssert(v == "abba", "Medium_005_Longest_Palindromic_Substring_Test #5")
    }
    func testCase006() {
        var v = Medium_005_Longest_Palindromic_Substring.longest("aaaaaa")
        XCTAssert(v == "aaaaaa", "Medium_005_Longest_Palindromic_Substring_Test #6")
    }
    func testCase007() {
        var v = Medium_005_Longest_Palindromic_Substring.longest("abbbaaaaaa")
        XCTAssert(v == "aaaaaa", "Medium_005_Longest_Palindromic_Substring_Test #7")
    }
    func testCase008() {
        var v = Medium_005_Longest_Palindromic_Substring.longest("abbbaaaaaab")
        XCTAssert(v == "baaaaaab", "Medium_005_Longest_Palindromic_Substring_Test #8")
    }
    func testCase009() {
        var v = Medium_005_Longest_Palindromic_Substring.longest("abbbaaeeaab")
        XCTAssert(v == "baaeeaab", "Medium_005_Longest_Palindromic_Substring_Test #9")
    }
    func testCase010() {
        var v = Medium_005_Longest_Palindromic_Substring.longest("abbbaaeaab")
        XCTAssert(v == "baaeaab", "Medium_005_Longest_Palindromic_Substring_Test #10")
    }
}