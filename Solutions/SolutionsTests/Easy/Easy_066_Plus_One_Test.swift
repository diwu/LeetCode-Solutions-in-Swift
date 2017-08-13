//
//  Easy_066_Plus_One_Test.swift
//  Solutions
//
//  Created by Di Wu on 7/16/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Easy_066_Plus_One_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Easy_066_Plus_One"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value * 100
    func test_001() {
        var input: [Int] = [1, 9, 9]
        let expected: [Int] = [2, 0, 0]
        asyncHelper(input: &input, expected: expected)
    }
    func test_002() {
        var input: [Int] = [0]
        let expected: [Int] = [1]
        asyncHelper(input: &input, expected: expected)
    }
    func test_003() {
        var input: [Int] = [9]
        let expected: [Int] = [1, 0]
        asyncHelper(input: &input, expected: expected)
    }
    func test_004() {
        var input: [Int] = [9, 9]
        let expected: [Int] = [1, 0, 0]
        asyncHelper(input: &input, expected: expected)
    }
    private func asyncHelper(input: inout [Int], expected: [Int]) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Easy_066_Plus_One_Test.TimeOutName)
        var localInput = input
        serialQueue().async(execute: { () -> Void in
            Easy_066_Plus_One.plusOne(&localInput)
            let result = localInput
            assertHelper(result == expected, problemName:self.problemName(), input: localInput, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Easy_066_Plus_One_Test.TimeOut) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: localInput, resultValue: Easy_066_Plus_One_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
