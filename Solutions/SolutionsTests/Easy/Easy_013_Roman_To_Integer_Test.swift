//
//  Easy_013_Roman_To_Integer_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/30/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_013_Roman_To_Integer_Test: XCTestCase {
    func test_001() {
        var s: String = "I"
        var i: Int = 1
        var v: Int = Easy_013_Roman_To_Integer.romanToInt(s: s)
        XCTAssert(v == i, "\(s) => \(i)")
    }
    func test_002() {
        var s: String = "MMMCMXCIX"
        var i: Int = 3999
        var v: Int = Easy_013_Roman_To_Integer.romanToInt(s: s)
        XCTAssert(v == i, "\(s) => \(i)")
    }
}

/*
    I           => 1
    MMMCMXCIX   => 3999
*/
