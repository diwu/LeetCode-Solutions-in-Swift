//
//  Easy_007_Reverse_Integer_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/27/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_007_Reverse_Integer_Test: XCTestCase {
    func test_001() {
        var v: Int = Easy_007_Reverse_Integer.reverse(123)
        XCTAssert(v == 321, "Easy_007_Reverse_Integer_Test #1")
    }
    func test_002() {
        var v: Int = Easy_007_Reverse_Integer.reverse(-1)
        XCTAssert(v == -1, "Easy_007_Reverse_Integer_Test #2")
    }
    func test_003() {
        var v: Int = Easy_007_Reverse_Integer.reverse(0)
        XCTAssert(v == 0, "Easy_007_Reverse_Integer_Test #3")
    }
    func test_004() {
        var v: Int = Easy_007_Reverse_Integer.reverse(7995774586302733229)
        XCTAssert(v == 0, "Easy_007_Reverse_Integer_Test #4")
    }
    func test_005() {
        var v: Int = Easy_007_Reverse_Integer.reverse(-7995774586302733229)
        XCTAssert(v == 0, "Easy_007_Reverse_Integer_Test #5")
    }
}