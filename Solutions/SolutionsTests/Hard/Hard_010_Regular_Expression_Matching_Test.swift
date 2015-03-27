//
//  Hard_010_Regular_Expression_Matching_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/27/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Hard_010_Regular_Expression_Matching_Test: XCTestCase {
    func test_001() {
        var v: Bool = Hard_010_Regular_Expression_Matching.isMatch("aa", p: "a")
        XCTAssert(v == false, "Hard_010_Regular_Expression_Matching_Test")
    }
    func test_002() {
        var v: Bool = Hard_010_Regular_Expression_Matching.isMatch("aa", p: "aa")
        XCTAssert(v == true, "Hard_010_Regular_Expression_Matching_Test")
    }
    func test_003() {
        var v: Bool = Hard_010_Regular_Expression_Matching.isMatch("aaa", p: "aa")
        XCTAssert(v == false, "Hard_010_Regular_Expression_Matching_Test")
    }
    func test_004() {
        var v: Bool = Hard_010_Regular_Expression_Matching.isMatch("aa", p: "a*")
        XCTAssert(v == true, "Hard_010_Regular_Expression_Matching_Test")
    }
    func test_005() {
        var v: Bool = Hard_010_Regular_Expression_Matching.isMatch("aa", p: ".*")
        XCTAssert(v == true, "Hard_010_Regular_Expression_Matching_Test")
    }
    func test_006() {
        var v: Bool = Hard_010_Regular_Expression_Matching.isMatch("ab", p: ".*")
        XCTAssert(v == true, "Hard_010_Regular_Expression_Matching_Test")
    }
    func test_007() {
        var v: Bool = Hard_010_Regular_Expression_Matching.isMatch("aab", p: "c*a*b")
        XCTAssert(v == true, "Hard_010_Regular_Expression_Matching_Test")
    }
    func test_008() {
        var v: Bool = Hard_010_Regular_Expression_Matching.isMatch("aaaaab", p: "c*a*b")
        XCTAssert(v == true, "Hard_010_Regular_Expression_Matching_Test")
    }
    func test_009() {
        var v: Bool = Hard_010_Regular_Expression_Matching.isMatch("ab", p: "c*ab")
        XCTAssert(v == true, "Hard_010_Regular_Expression_Matching_Test")
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