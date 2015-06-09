//
//  Medium_017_Letter_Combinations_Of_A_Phone_Number_Test.swift
//  Solutions
//
//  Created by Di Wu on 4/18/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_017_Letter_Combinations_Of_A_Phone_Number_Test: XCTestCase {

    let ProblemName: String = "Medium_017_Letter_Combinations_Of_A_Phone_Number"
    
    func test_001() {
        let input: String = "23"
        let result: Set<String> = Set(Medium_017_Letter_Combinations_Of_A_Phone_Number.letterCombinations(input))
        let expected: Set<String> = Set(["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"])
        assertHelper(result == expected, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_002() {
        let input: String = ""
        let result: Set<String> = Set(Medium_017_Letter_Combinations_Of_A_Phone_Number.letterCombinations(input))
        let expected: Set<String> = Set([""])
        assertHelper(result == expected, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_003() {
        let input: String = "2"
        let result: Set<String> = Set(Medium_017_Letter_Combinations_Of_A_Phone_Number.letterCombinations(input))
        let expected: Set<String> = Set(["a", "b", "c"])
        assertHelper(result == expected, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
    }
}
