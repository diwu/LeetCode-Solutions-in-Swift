//
//  Easy_006_ZigZag_Conversion_Test.swift
//  Solutions
//
//  Created by Di Wu on 3/6/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_006_ZigZag_Conversion_Test: XCTestCase {
    func testCase001() {
        var str1: String = Easy_006_ZigZag_Conversion.convert("PAYPALISHIRING", nRows:3)
        var str2: String = "PAHNAPLSIIGYIR"
        XCTAssert(str1 == str2, "Pass")
    }
}
