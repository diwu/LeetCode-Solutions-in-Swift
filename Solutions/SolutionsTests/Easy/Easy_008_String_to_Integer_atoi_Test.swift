//
//  Easy_008_String_to_Integer_atoi_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/27/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_008_String_to_Integer_atoi_Test: XCTestCase, SolutionsTestCase {

    private static let ProblemName: String = "Easy_008_String_to_Integer_atoi"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value

    func test_001() {
        let input: String = "123"
        let expected: Int = 123
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: String = "     123"
        let expected: Int = 123
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: String = "    +123"
        let expected: Int = 123
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: String = "-123"
        let expected: Int = -123
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: String = "    -123"
        let expected: Int = -123
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: String = String(Int.max)
        let expected: Int = 9223372036854775807
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: String = "  9223372036854775808"
        let expected: Int = 9223372036854775807
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        let input: String = "  9223372036854775806"
        let expected: Int = 9223372036854775806
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        let input: String = String(Int.min)
        let expected: Int = -9223372036854775808
        asyncHelper(input: input, expected: expected)
    }
    func test_010() {
        let input: String = " -9223372036854775809"
        let expected: Int = -9223372036854775808
        asyncHelper(input: input, expected: expected)
    }
    func test_011() {
        let input: String = " -9223372036854775806"
        let expected: Int = -9223372036854775806
        asyncHelper(input: input, expected: expected)
    }
    func test_012() {
        let input: String = "   123-   "
        let expected: Int = 123
        asyncHelper(input: input, expected: expected)
    }
    func test_013() {
        let input: String = "  -9223372036854775808-"
        let expected: Int = -9223372036854775808
        asyncHelper(input: input, expected: expected)
    }
    func test_014() {
        let input: String = "  -9223372036854775807-"
        let expected: Int = -9223372036854775807
        asyncHelper(input: input, expected: expected)
    }
    func test_015() {
        let input: String = "  ?123"
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_016() {
        let input: String = "  ??123"
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_017() {
        let input: String = "  123?"
        let expected: Int = 123
        asyncHelper(input: input, expected: expected)
    }
    func test_018() {
        let input: String = "  123??"
        let expected: Int = 123
        asyncHelper(input: input, expected: expected)
    }
    func test_019() {
        let input: String = "  ++123"
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_020() {
        let input: String = "  +-123"
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_021() {
        let input: String = "  +123+"
        let expected: Int = 123
        asyncHelper(input: input, expected: expected)
    }
    func test_022() {
        let input: String = "  -123+"
        let expected: Int = -123
        asyncHelper(input: input, expected: expected)
    }
    func asyncHelper(input: String, expected: Int ) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Easy_008_String_to_Integer_atoi_Test.TimeOutName)
        serialQueue().async(execute: { () -> Void in
            let result: Int = Easy_008_String_to_Integer_atoi.atoi(input)
            assertHelper(result == expected, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Easy_008_String_to_Integer_atoi_Test.TimeOut) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input, resultValue: Easy_008_String_to_Integer_atoi_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
