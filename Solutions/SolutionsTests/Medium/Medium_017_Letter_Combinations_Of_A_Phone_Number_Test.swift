//
//  Medium_017_Letter_Combinations_Of_A_Phone_Number_Test.swift
//  Solutions
//
//  Created by Di Wu on 4/18/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_017_Letter_Combinations_Of_A_Phone_Number_Test: XCTestCase {

    private static let ProblemName: String = "Medium_017_Letter_Combinations_Of_A_Phone_Number"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    
    func test_001() {
        let input: String = "23"
        let expected = ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: String = ""
        let expected = [""]
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: String = "2"
        let expected = ["a", "b", "c"]
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: String = "023"
        let expected = ["0ad", "0ae", "0af", "0bd", "0be", "0bf", "0cd", "0ce", "0cf"]
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: String = "210"
        let expected = ["a10", "b10", "c10"]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input input: String, expected: [String]) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Medium_017_Letter_Combinations_Of_A_Phone_Number_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            let result_swift: Set<String> = Set(Medium_017_Letter_Combinations_Of_A_Phone_Number.letterCombinations(input))
            let result_objc: Set<String> = Set(ObjC_Medium_017_Letter_Combinations_Of_A_Phone_Number.letterCombinations(input))
            let expectedSet: Set<String> = Set(expected)
            assertHelper(result_swift == expectedSet, problemName: Medium_017_Letter_Combinations_Of_A_Phone_Number_Test.ProblemName, input: input, resultValue: result_swift, expectedValue: expected)
            assertHelper(result_objc == expectedSet, problemName: Medium_017_Letter_Combinations_Of_A_Phone_Number_Test.ProblemName, input: input, resultValue: result_objc, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Medium_017_Letter_Combinations_Of_A_Phone_Number_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_017_Letter_Combinations_Of_A_Phone_Number_Test.ProblemName, input: input, resultValue: Medium_017_Letter_Combinations_Of_A_Phone_Number_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
