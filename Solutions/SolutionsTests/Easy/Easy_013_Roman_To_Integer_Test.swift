//
//  Easy_013_Roman_To_Integer_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/30/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_013_Roman_To_Integer_Test: XCTestCase, SolutionsTestCase {


    func test_001() {
        let input: String = "I"
        let expected: Int = 1
        let result: Int = Easy_013_Roman_To_Integer.romanToInt(s: input)
        assertHelper(result == expected, problemName: problemName(), input: input, resultValue: result, expectedValue: expected)
    }
    func test_002() {
        let input: String = "MMMCMXCIX"
        let expected: Int = 3999
        let result: Int = Easy_013_Roman_To_Integer.romanToInt(s: input)
        assertHelper(result == expected, problemName: problemName(), input: input, resultValue: result, expectedValue: expected)
    }
}

/*
    I           => 1
    MMMCMXCIX   => 3999
*/
