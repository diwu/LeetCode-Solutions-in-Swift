//
//  Easy_013_Roman_To_Integer_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/30/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_013_Roman_To_Integer_Test: XCTestCase {

    let ProblemName: String = "Easy_013_Roman_To_Integer"

    func test_001() {
        var input: String = "I"
        var expected: Int = 1
        var result: Int = Easy_013_Roman_To_Integer.romanToInt(s: input)
        assertHelper(result == expected, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_002() {
        var input: String = "MMMCMXCIX"
        var expected: Int = 3999
        var result: Int = Easy_013_Roman_To_Integer.romanToInt(s: input)
        assertHelper(result == expected, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
    }
}

/*
    I           => 1
    MMMCMXCIX   => 3999
*/
