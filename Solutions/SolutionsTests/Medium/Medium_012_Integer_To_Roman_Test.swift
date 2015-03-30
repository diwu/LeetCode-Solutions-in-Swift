//
//  Medium_012_Integer_To_Roman_Test.swift
//  Solutions
//
//  Created by test on 3/29/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_012_Integer_To_Roman_Test: XCTestCase {

    let probleName: String = "Medium_012_Integer_To_Roman_Test"

    func test_001() {
        var num: Int = 1
        var r: String = Medium_012_Integer_To_Roman.integerToRoman(num: num)
        var e: String = "I"
        assertHelper(r == e, problemName: probleName, input: num, resultValue: r, expectedValue: e)
    }
    func test_002() {
        var num: Int = 3999
        var r: String = Medium_012_Integer_To_Roman.integerToRoman(num: num)
        var e: String = "MMMCMXCIX"
        assertHelper(r == e, problemName: probleName, input: num, resultValue: r, expectedValue: e)
    }

}

/*
    1       =>  I
    3999    =>  MMMCMXCIX
*/
