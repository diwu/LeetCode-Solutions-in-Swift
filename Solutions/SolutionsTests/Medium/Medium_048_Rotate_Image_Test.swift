//
//  Medium_048_Rotate_Image_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/23/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_048_Rotate_Image_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Medium_048_Rotate_Image"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [[Int]] = [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9]
        ]
        let expected: [[Int]] = [
            [7, 4, 1],
            [8, 5, 2],
            [9, 6, 3]
        ]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [[Int]], expected: [[Int]]) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Medium_048_Rotate_Image_Test.TimeOutName)
        serialQueue().async(execute: { () -> Void in
            var result = input
            Medium_048_Rotate_Image.rotate(&result)
            assertHelper(compareTwoDimensionIntArray(arr0: result, arr1: expected), problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Medium_048_Rotate_Image_Test.TimeOut) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input, resultValue: Medium_048_Rotate_Image_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
