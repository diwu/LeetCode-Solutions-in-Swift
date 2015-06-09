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
}

/*
reverse(123)                    //321
reverse(-1)                     //-1
reverse(0)                      //0
reverse(7995774586302733229)    //overflow
reverse(-7995774586302733229)   //overflow
*/