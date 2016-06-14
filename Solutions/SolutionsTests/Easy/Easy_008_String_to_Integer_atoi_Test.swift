//
//  Easy_008_String_to_Integer_atoi_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/27/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_008_String_to_Integer_atoi_Test: XCTestCase {

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
    func asyncHelper(input: String, expected: Int ) {
        weak var expectation: XCTestExpectation? = self.expectation(withDescription: Easy_008_String_to_Integer_atoi_Test.TimeOutName)
        DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault).async(execute: { () -> Void in
            let result: Int = Easy_008_String_to_Integer_atoi.atoi(input)
            assertHelper(result == expected, problemName: Easy_008_String_to_Integer_atoi_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(withTimeout: Easy_008_String_to_Integer_atoi_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Easy_008_String_to_Integer_atoi_Test.ProblemName, input: input, resultValue: Easy_008_String_to_Integer_atoi_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}

/*
atoi("123")                     //123
atoi("     123")                //123
atoi("    +123")                //123
atoi("-123")                    //-123
atoi("    -123")                //-123
atoi(String(Int.max))           //9223372036854775807
atoi("  9223372036854775808")   //9223372036854775807, overflow
atoi("  9223372036854775806")   //9223372036854775806
atoi(String(Int.min))           //-9223372036854775808
atoi(" -9223372036854775809")   //9223372036854775808, overflow
atoi(" -9223372036854775806")   //-9223372036854775806
*/
