//
//  Medium_012_Integer_To_Roman_Test.swift
//  Solutions
//
//  Created by test on 3/29/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_012_Integer_To_Roman_Test: XCTestCase {
    func test_001() {
        var num: Int = 1
        var v: String = Medium_012_Integer_To_Roman.integerToRoman(num: num)
        XCTAssert(v == "I", "012: \(num) => \(v)")
    }
    func test_002() {
        var num: Int = 3999
        var v: String = Medium_012_Integer_To_Roman.integerToRoman(num: num)
        XCTAssert(v == "MMMCMXCIX", "012: \(num) => \(v)")
    }

}

/*
    1       =>  I
    3999    =>  MMMCMXCIX
*/
