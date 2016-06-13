//
//  Easy_007_Reverse_Integer_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/27/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_007_Reverse_Integer_Test: XCTestCase {

    let ProbleName: String = "Easy_007_Reverse_Integer"

    func test_001() {
        let input: Int = 123
        let expected: Int = 321
        let result = Easy_007_Reverse_Integer.reverse(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_002() {
        let input: Int = -1
        let expected: Int = -1
        let result = Easy_007_Reverse_Integer.reverse(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_003() {
        let input: Int = 0
        let expected: Int = 0
        let result = Easy_007_Reverse_Integer.reverse(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_004() {
        let input: Int = 7995774586302733229
        let expected: Int = 0
        let result = Easy_007_Reverse_Integer.reverse(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_005() {
        let input: Int = -7995774586302733229
        let expected: Int = 0
        let result = Easy_007_Reverse_Integer.reverse(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_006() {
        let input: Int = -9223372036854775807
        let expected: Int = -7085774586302733229
        let result = Easy_007_Reverse_Integer.reverse(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_007() {
        let input: Int = -9223372036854775808
        let expected: Int = -8085774586302733229
        let result = Easy_007_Reverse_Integer.reverse(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
}