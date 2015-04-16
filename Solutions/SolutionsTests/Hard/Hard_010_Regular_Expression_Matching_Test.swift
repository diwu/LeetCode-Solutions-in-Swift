//
//  Hard_010_Regular_Expression_Matching_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/27/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Hard_010_Regular_Expression_Matching_Test: XCTestCase {

    let ProbleName: String = "Hard_010_Regular_Expression_Matching"

    func test_001() {
        var input: [String] = ["aa", "a"]
        var expected: Bool = false
        var result = Hard_010_Regular_Expression_Matching.isMatch(s: input[0], p: input[1])
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_002() {
        var input: [String] = ["aa", "aa"]
        var expected: Bool = true
        var result = Hard_010_Regular_Expression_Matching.isMatch(s: input[0], p: input[1])
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_003() {
        var input: [String] = ["aaa", "aa"]
        var expected: Bool = false
        var result = Hard_010_Regular_Expression_Matching.isMatch(s: input[0], p: input[1])
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_004() {
        var input: [String] = ["aa", "a*"]
        var expected: Bool = true
        var result = Hard_010_Regular_Expression_Matching.isMatch(s: input[0], p: input[1])
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_005() {
        var input: [String] = ["aa", ".*"]
        var expected: Bool = true
        var result = Hard_010_Regular_Expression_Matching.isMatch(s: input[0], p: input[1])
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_006() {
        var input: [String] = ["ab", ".*"]
        var expected: Bool = true
        var result = Hard_010_Regular_Expression_Matching.isMatch(s: input[0], p: input[1])
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_007() {
        var input: [String] = ["aab", "c*a*b"]
        var expected: Bool = true
        var result = Hard_010_Regular_Expression_Matching.isMatch(s: input[0], p: input[1])
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_008() {
        var input: [String] = ["aaaaab", "c*a*b"]
        var expected: Bool = true
        var result = Hard_010_Regular_Expression_Matching.isMatch(s: input[0], p: input[1])
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_009() {
        var input: [String] = ["ab", "c*ab"]
        var expected: Bool = true
        var result = Hard_010_Regular_Expression_Matching.isMatch(s: input[0], p: input[1])
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
}

/*
isMatch("aa", "a")
isMatch("aa", "aa")
isMatch("aaa", "aa")
isMatch("aa", "a*")
isMatch("aa", ".*")
isMatch("ab", ".*")
isMatch("aab", "c*a*b")
isMatch("aaaaab", "c*a*b")
isMatch("ab", "c*ab")
*/