//
//  Medium_003_Longest_Substring_Without_Repeating_Characters_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/27/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_003_Longest_Substring_Without_Repeating_Characters_Test: XCTestCase {
    func testCase001() {
        var v = Medium_003_Longest_Substring_Without_Repeating_Characters.longest("abcabcdzaba")
        XCTAssert(v == 5, "Medium_003_Longest_Substring_Without_Repeating_Characters_Test #1")
    }

    func testCase002() {
        var v = Medium_003_Longest_Substring_Without_Repeating_Characters.longest("aaaa")
        XCTAssert(v == 1, "Medium_003_Longest_Substring_Without_Repeating_Characters_Test #2")
    }

    func testCase003() {
        var v = Medium_003_Longest_Substring_Without_Repeating_Characters.longest("aaabbbc")
        XCTAssert(v == 2, "Medium_003_Longest_Substring_Without_Repeating_Characters_Test #3")
    }

    func testCase004() {
        var v = Medium_003_Longest_Substring_Without_Repeating_Characters.longest("")
        XCTAssert(v == 0, "Medium_003_Longest_Substring_Without_Repeating_Characters_Test #4")
    }
}