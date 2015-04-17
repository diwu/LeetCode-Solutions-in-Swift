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
        var input: Int = 123
        var expected: Int = 321
        var result = Easy_007_Reverse_Integer.reverse(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_002() {
        var input: Int = -1
        var expected: Int = -1
        var result = Easy_007_Reverse_Integer.reverse(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_003() {
        var input: Int = 0
        var expected: Int = 0
        var result = Easy_007_Reverse_Integer.reverse(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_004() {
        var input: Int = 7995774586302733229
        var expected: Int = 0
        var result = Easy_007_Reverse_Integer.reverse(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_005() {
        var input: Int = -7995774586302733229
        var expected: Int = 0
        var result = Easy_007_Reverse_Integer.reverse(input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
}

/*
reverse(123)                    //321
reverse(-1)                     //-1
reverse(0)                      //0
reverse(7995774586302733229)    //overflow
reverse(-7995774586302733229)   //overflow
*/