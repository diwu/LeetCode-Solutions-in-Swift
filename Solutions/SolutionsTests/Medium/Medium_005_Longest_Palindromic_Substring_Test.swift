//
//  Medium_005_Longest_Palindromic_Substring_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/27/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_005_Longest_Palindromic_Substring_Test: XCTestCase {

    let ProbleName: String = "Medium_005_Longest_Palindromic_Substring"

    func test_001() {
        var input: String = "a"
        var expected: String = "a"
        var result = Medium_005_Longest_Palindromic_Substring.longest(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_002() {
        var input: String = "aab"
        var expected: String = "aa"
        var result = Medium_005_Longest_Palindromic_Substring.longest(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_003() {
        var input: String = "abb"
        var expected: String = "bb"
        var result = Medium_005_Longest_Palindromic_Substring.longest(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_004() {
        var input: String = "abbc"
        var expected: String = "bb"
        var result = Medium_005_Longest_Palindromic_Substring.longest(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_005() {
        var input: String = "abbaaac"
        var expected: String = "abba"
        var result = Medium_005_Longest_Palindromic_Substring.longest(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_006() {
        var input: String = "aaaaaa"
        var expected: String = "aaaaaa"
        var result = Medium_005_Longest_Palindromic_Substring.longest(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_007() {
        var input: String = "abbbaaaaaa"
        var expected: String = "aaaaaa"
        var result = Medium_005_Longest_Palindromic_Substring.longest(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_008() {
        var input: String = "abbbaaaaaab"
        var expected: String = "baaaaaab"
        var result = Medium_005_Longest_Palindromic_Substring.longest(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_009() {
        var input: String = "abbbaaeeaab"
        var expected: String = "baaeeaab"
        var result = Medium_005_Longest_Palindromic_Substring.longest(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_010() {
        var input: String = "abbbaaeaab"
        var expected: String = "baaeaab"
        var result = Medium_005_Longest_Palindromic_Substring.longest(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
}

/*
longest("a")            //a
longest("aab")          //aa
longest("abb")          //bb
longest("abbc")         //bb
longest("abbaaac")      //abba
longest("aaaaaa")       //aaaaaa
longest("abbbaaaaaa")   //aaaaaa
longest("abbbaaaaaab")  //baaaaaab
longest("abbbaaeeaab")  //baaeeaab
longest("abbbaaeaab")   //baaeaab
*/