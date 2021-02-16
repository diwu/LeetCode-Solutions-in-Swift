//
//  Easy_006_ZigZag_Conversion_Test.swift
//  Solutions
//
//  Created by Di Wu on 3/6/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_006_ZigZag_Conversion_Test: XCTestCase, SolutionsTestCase {

    func test_001() {
        let input: [Any] = ["PAYPALISHIRING", 3]
        let expected: String = "PAHNAPLSIIGYIR"
        let result = Easy_006_ZigZag_Conversion.convert(s: input[0] as! String, nRows: input[1] as! Int)
        assertHelper(result == expected, problemName: problemName(), input: input, resultValue: result, expectedValue: expected)
    }
    
    func test_002() {
        let input: [Any] = ["PAYPALISHIRING", 1]
        let expected: String = "PAYPALISHIRING"
        let result = Easy_006_ZigZag_Conversion.convert(s: input[0] as! String, nRows: input[1] as! Int)
        assertHelper(result == expected, problemName: problemName(), input: input, resultValue: result, expectedValue: expected)
    }
    
    func test_003() {
        let input: [Any] = ["", 3]
        let expected: String = ""
        let result = Easy_006_ZigZag_Conversion.convert(s: input[0] as! String, nRows: input[1] as! Int)
        assertHelper(result == expected, problemName: problemName(), input: input, resultValue: result, expectedValue: expected)
    }
    
    func test_004() {
        /*
         P   I   N
         A L S I G
         Y A H R
         P   I
         */
        let input: [Any] = ["PAYPALISHIRING", 4]
        let expected: String = "PINALSIGYAHRPI"
        let result = Easy_006_ZigZag_Conversion.convert(s: input[0] as! String, nRows: input[1] as! Int)
        assertHelper(result == expected, problemName: problemName(), input: input, resultValue: result, expectedValue: expected)
    }
}

/*
"PAYPALISHIRING" -> "PAHNAPLSIIGYIR"
*/
