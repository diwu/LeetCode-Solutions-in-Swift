//
//  Easy_008_String_to_Integer_atoi_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/27/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_008_String_to_Integer_atoi_Test: XCTestCase {

    let ProbleName: String = "Easy_008_String_to_Integer_atoi"

    func test_001() {
        var input: String = "123"
        var expected: Int = 123
        var result = Easy_008_String_to_Integer_atoi.atoi(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_002() {
        var input: String = "     123"
        var expected: Int = 123
        var result = Easy_008_String_to_Integer_atoi.atoi(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_003() {
        var input: String = "    +123"
        var expected: Int = 123
        var result = Easy_008_String_to_Integer_atoi.atoi(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_004() {
        var input: String = "-123"
        var expected: Int = -123
        var result = Easy_008_String_to_Integer_atoi.atoi(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_005() {
        var input: String = "    -123"
        var expected: Int = -123
        var result = Easy_008_String_to_Integer_atoi.atoi(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_006() {
        var input: String = String(Int.max)
        var expected: Int = 9223372036854775807
        var result = Easy_008_String_to_Integer_atoi.atoi(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_007() {
        var input: String = "  9223372036854775808"
        var expected: Int = 9223372036854775807
        var result = Easy_008_String_to_Integer_atoi.atoi(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_008() {
        var input: String = "  9223372036854775806"
        var expected: Int = 9223372036854775806
        var result = Easy_008_String_to_Integer_atoi.atoi(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_009() {
        var input: String = String(Int.min)
        var expected: Int = -9223372036854775808
        var result = Easy_008_String_to_Integer_atoi.atoi(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_010() {
        var input: String = " -9223372036854775809"
        var expected: Int = -9223372036854775808
        var result = Easy_008_String_to_Integer_atoi.atoi(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_011() {
        var input: String = " -9223372036854775806"
        var expected: Int = -9223372036854775806
        var result = Easy_008_String_to_Integer_atoi.atoi(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
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