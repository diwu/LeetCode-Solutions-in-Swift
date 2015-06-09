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
        let input: String = "a"
        let expected: String = "a"
        let result = Medium_005_Longest_Palindromic_Substring.longest(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_002() {
        let input: String = "aab"
        let expected: String = "aa"
        let result = Medium_005_Longest_Palindromic_Substring.longest(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_003() {
        let input: String = "abb"
        let expected: String = "bb"
        let result = Medium_005_Longest_Palindromic_Substring.longest(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_004() {
        let input: String = "abbc"
        let expected: String = "bb"
        let result = Medium_005_Longest_Palindromic_Substring.longest(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_005() {
        let input: String = "abbaaac"
        let expected: String = "abba"
        let result = Medium_005_Longest_Palindromic_Substring.longest(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_006() {
        let input: String = "aaaaaa"
        let expected: String = "aaaaaa"
        let result = Medium_005_Longest_Palindromic_Substring.longest(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_007() {
        let input: String = "abbbaaaaaa"
        let expected: String = "aaaaaa"
        let result = Medium_005_Longest_Palindromic_Substring.longest(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_008() {
        let input: String = "abbbaaaaaab"
        let expected: String = "baaaaaab"
        let result = Medium_005_Longest_Palindromic_Substring.longest(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_009() {
        let input: String = "abbbaaeeaab"
        let expected: String = "baaeeaab"
        let result = Medium_005_Longest_Palindromic_Substring.longest(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_010() {
        let input: String = "abbbaaeaab"
        let expected: String = "baaeaab"
        let result = Medium_005_Longest_Palindromic_Substring.longest(input)
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