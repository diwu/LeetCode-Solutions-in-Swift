//
//  Medium_005_Longest_Palindromic_Substring_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/27/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_005_Longest_Palindromic_Substring_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Medium_005_Longest_Palindromic_Substring"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value

    func test_001() {
        let input: String = "a"
        let expected: String = "a"
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: String = "aab"
        let expected: String = "aa"
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: String = "abb"
        let expected: String = "bb"
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: String = "abbc"
        let expected: String = "bb"
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: String = "abbaaac"
        let expected: String = "abba"
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: String = "aaaaaa"
        let expected: String = "aaaaaa"
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: String = "abbbaaaaaa"
        let expected: String = "aaaaaa"
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        let input: String = "abbbaaaaaab"
        let expected: String = "baaaaaab"
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        let input: String = "abbbaaeeaab"
        let expected: String = "baaeeaab"
        asyncHelper(input: input, expected: expected)
    }
    func test_010() {
        let input: String = "abbbaaeaab"
        let expected: String = "baaeaab"
        asyncHelper(input: input, expected: expected)
    }
    func test_011() {
        let input: String = "aaaaaaa"
        let expected: String = "aaaaaaa"
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: String, expected: String) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Medium_005_Longest_Palindromic_Substring_Test.TimeOutName)
        serialQueue().async(execute: { () -> Void in
            let result_swift: String = Medium_005_Longest_Palindromic_Substring.longestPalindrome(input)
            let result_objc: String = ObjC_Medium_005_Longest_Palindromic_Substring.longestPalindrome(input)
            assertHelper(expected == result_swift, problemName:self.problemName(), input: input, resultValue: result_swift, expectedValue: expected)
            assertHelper(expected == result_objc, problemName:self.problemName(), input: input, resultValue: result_objc, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Medium_005_Longest_Palindromic_Substring_Test.TimeOut) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input, resultValue: Medium_005_Longest_Palindromic_Substring_Test.TimeOutName, expectedValue: expected)
            }
        }
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
