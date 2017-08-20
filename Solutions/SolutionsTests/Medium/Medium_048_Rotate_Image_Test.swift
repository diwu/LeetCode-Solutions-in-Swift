//
//  Medium_048_Rotate_Image_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/23/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_048_Rotate_Image_Test: XCTestCase, SolutionsTestCase {
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
    func test_002() {
        let input: [[Int]] = [
            [1, 2, 3, 4],
            [5, 6, 7, 8],
            [9, 10, 11, 12],
            [13, 14, 15, 16]
        ]
        let expected: [[Int]] = [
            [13, 9, 5, 1],
            [14, 10, 6, 2],
            [15, 11, 7, 3],
            [16, 12, 8, 4]
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [[Int]] = [
            [1]
        ]
        let expected: [[Int]] = [
            [1]
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [[Int]] = [
            [1, 2],
            [3, 4]
        ]
        let expected: [[Int]] = [
            [3, 1],
            [4, 2]
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [[Int]] = [
            [1, 2, 3, 4, 5],
            [6, 7, 8, 9, 10],
            [11, 12, 13, 14, 15],
            [16, 17, 18, 19, 20],
            [21, 22, 23, 24, 25]
        ]
        let expected: [[Int]] = [
            [21, 16, 11, 6, 1],
            [22, 17, 12, 7, 2],
            [23, 18, 13, 8, 3],
            [24, 19, 14, 9, 4],
            [25, 20, 15, 10, 5]
        ]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [[Int]], expected: [[Int]]) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            var result = input
            Medium_048_Rotate_Image.rotate(&result)
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
