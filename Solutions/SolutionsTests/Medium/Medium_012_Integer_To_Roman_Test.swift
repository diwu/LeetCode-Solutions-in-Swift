//
//  Medium_012_Integer_To_Roman_Test.swift
//  Solutions
//
//  Created by test on 3/29/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_012_Integer_To_Roman_Test: XCTestCase {

    let ProbleName: String = "Medium_012_Integer_To_Roman"

    func test_001() {
        var input: Int = 1
        var result: String = Medium_012_Integer_To_Roman.integerToRoman(num: input)
        var expected: String = "I"
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_002() {
        var input: Int = 3999
        var result: String = Medium_012_Integer_To_Roman.integerToRoman(num: input)
        var expected: String = "MMMCMXCIX"
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }

}

/*
    1       =>  I
    3999    =>  MMMCMXCIX
*/
