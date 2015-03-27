//
//  Easy_008_String_to_Integer_atoi_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/27/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_008_String_to_Integer_atoi_Test: XCTestCase {
    func test_001() {
        var v: Int = Easy_008_String_to_Integer_atoi.atoi("123")
        XCTAssert(v == 123, "Easy_008_String_to_Integer_atoi_Test #1")
    }
    func test_002() {
        var v: Int = Easy_008_String_to_Integer_atoi.atoi("     123")
        XCTAssert(v == 123, "Easy_008_String_to_Integer_atoi_Test #2")
    }
    func test_003() {
        var v: Int = Easy_008_String_to_Integer_atoi.atoi("    +123")
        XCTAssert(v == 123, "Easy_008_String_to_Integer_atoi_Test #3")
    }
    func test_004() {
        var v: Int = Easy_008_String_to_Integer_atoi.atoi("-123")
        XCTAssert(v == -123, "Easy_008_String_to_Integer_atoi_Test #4")
    }
    func test_005() {
        var v: Int = Easy_008_String_to_Integer_atoi.atoi("    -123")
        XCTAssert(v == -123, "Easy_008_String_to_Integer_atoi_Test #5")
    }
    func test_006() {
        var v: Int = Easy_008_String_to_Integer_atoi.atoi(String(Int.max))
        XCTAssert(v == 9223372036854775807, "Easy_008_String_to_Integer_atoi_Test #6")
    }
    func test_007() {
        var v: Int = Easy_008_String_to_Integer_atoi.atoi("  9223372036854775808")
        XCTAssert(v == 9223372036854775807, "Easy_008_String_to_Integer_atoi_Test #7")
    }
    func test_008() {
        var v: Int = Easy_008_String_to_Integer_atoi.atoi("  9223372036854775806")
        XCTAssert(v == 9223372036854775806, "Easy_008_String_to_Integer_atoi_Test #8")
    }
    func test_009() {
        var v: Int = Easy_008_String_to_Integer_atoi.atoi(String(Int.min))
        XCTAssert(v == -9223372036854775808, "Easy_008_String_to_Integer_atoi_Test #9")
    }
    func test_010() {
        var v: Int = Easy_008_String_to_Integer_atoi.atoi(" -9223372036854775809")
        XCTAssert(v == -9223372036854775808, "Easy_008_String_to_Integer_atoi_Test #10")
    }
    func test_011() {
        var v: Int = Easy_008_String_to_Integer_atoi.atoi(" -9223372036854775806")
        XCTAssert(v == -9223372036854775806, "Easy_008_String_to_Integer_atoi_Test #11")
    }
}

/*
atoi("123")                     //123
atoi("     123")                //123
atoi("    +123")                //123
atoi("-123")                    //-123
atoi("    -123")                //-123
atoi(String(Int.max))           //9223372036854775807
atoi("  9223372036854775808")   //9223372036854775807, overflow
atoi("  9223372036854775806")   //9223372036854775806
atoi(String(Int.min))           //-9223372036854775808
atoi(" -9223372036854775809")   //9223372036854775808, overflow
atoi(" -9223372036854775806")   //-9223372036854775806
*/