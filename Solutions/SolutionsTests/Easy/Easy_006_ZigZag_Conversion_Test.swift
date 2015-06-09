//
//  Easy_006_ZigZag_Conversion_Test.swift
//  Solutions
//
//  Created by Di Wu on 3/6/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_006_ZigZag_Conversion_Test: XCTestCase {

    let ProbleName: String = "Easy_006_ZigZag_Conversion"

    func testCase001() {
        var input: [AnyObject] = ["PAYPALISHIRING", 3]
        let expected: String = "PAHNAPLSIIGYIR"
        let result = Easy_006_ZigZag_Conversion.convert(s: input[0] as! String, nRows: input[1] as! Int)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
}

/*
"PAYPALISHIRING" -> "PAHNAPLSIIGYIR"
*/