//
//  Medium_073_Set_Matrix_Zeroes_Test.swift
//  Solutions
//
//  Created by Di Wu on 7/30/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_073_Set_Matrix_Zeroes_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Medium_073_Set_Matrix_Zeroes"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [[Int]] = [
            [1, 1, 1, 1],
            [1, 0, 1, 1],
            [1, 1, 1, 1]
        ]
        let expected: [[Int]] = [
            [1, 0, 1, 1],
            [0, 0, 0, 0],
            [1, 0, 1, 1]
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [[Int]] = [
            [1, 1, 1, 1],
            [1, 0, 1, 1],
            [1, 1, 1, 0]
        ]
        let expected: [[Int]] = [
            [1, 0, 1, 0],
            [0, 0, 0, 0],
            [0, 0, 0, 0]
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [[Int]] = [
            [1, 1, 1, 1],
            [1, 0, 1, 1],
            [1, 0, 1, 1],
            [1, 1, 1, 1],
            [1, 1, 1, 1]
        ]
        let expected: [[Int]] = [
            [1, 0, 1, 1],
            [0, 0, 0, 0],
            [0, 0, 0, 0],
            [1, 0, 1, 1],
            [1, 0, 1, 1]
        ]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input ipt: [[Int]], expected: [[Int]]) {
        var input = ipt
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            Medium_073_Set_Matrix_Zeroes.setZeros(&input)
            let result = input
            assertHelper(compareTwoDimensionIntArray(arr0: result, arr1: expected), problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout:timeOut()) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input, resultValue:self.timeOutName(), expectedValue: expected)
            }
        }
    }
}
