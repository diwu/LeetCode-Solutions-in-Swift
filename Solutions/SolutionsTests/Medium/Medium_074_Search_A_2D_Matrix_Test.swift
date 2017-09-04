//
//  Medium_074_Search_A_2D_Matrix_Test.swift
//  Solutions
//
//  Created by Di Wu on 7/30/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_074_Search_A_2D_Matrix_Test: XCTestCase, SolutionsTestCase {
    func test_001() {
        let input0: [[Int]] = [
            [1,   3,  5,  7],
            [10, 11, 16, 20],
            [23, 30, 34, 50]
        ]
        let input1: Int = 3
        let expected: Bool = true
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_002() {
        let input0: [[Int]] = [
            [1,   3,  5,  7],
            [10, 11, 16, 20],
            [23, 30, 34, 50]
        ]
        let input1: Int = 4
        let expected: Bool = false
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_003() {
        let input0: [[Int]] = [
            [1,   3,  5,  7],
            [10, 11, 16, 20],
            [23, 30, 34, 50]
        ]
        let input1: Int = 51
        let expected: Bool = false
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_004() {
        let input0: [[Int]] = [
            [1]
        ]
        let input1: Int = 1
        let expected: Bool = true
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_005() {
        let input0: [[Int]] = [
            [1],
            [1],
            [1]
        ]
        let input1: Int = 1
        let expected: Bool = true
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_006() {
        let input0: [[Int]] = [
            [1, 1, 1]
        ]
        let input1: Int = 1
        let expected: Bool = true
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_007() {
        let input0: [[Int]] = [
            [1, 2, 3]
        ]
        let input1: Int = 3
        let expected: Bool = true
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_008() {
        let input0: [[Int]] = [
            [1],
            [2],
            [3]
        ]
        let input1: Int = 3
        let expected: Bool = true
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_009() {
        let input0: [[Int]] = [
            []
        ]
        let input1: Int = 1
        let expected: Bool = false
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_010() {
        let input0: [[Int]] = [
        ]
        let input1: Int = 1
        let expected: Bool = false
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    private func asyncHelper(input0: [[Int]], input1: Int, expected: Bool) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result = Medium_074_Search_A_2D_Matrix.searchMatrix(matrix: input0, target: input1)
            assertHelper(result == expected, problemName:self.problemName(), input: input0, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout:timeOut()) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input0, resultValue:self.timeOutName(), expectedValue: expected)
            }
        }
    }
}
