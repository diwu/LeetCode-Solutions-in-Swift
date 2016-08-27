//
//  Medium_074_Search_A_2D_Matrix_Test.swift
//  Solutions
//
//  Created by Di Wu on 7/30/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_074_Search_A_2D_Matrix_Test: XCTestCase {
    private static let ProblemName: String = "Medium_074_Search_A_2D_Matrix"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
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
    private func asyncHelper(input0: [[Int]], input1: Int, expected: Bool) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Medium_074_Search_A_2D_Matrix_Test.TimeOutName)
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async(execute: { () -> Void in
            let result = Medium_074_Search_A_2D_Matrix.searchMatrix(matrix: input0, target: input1)
            assertHelper(result == expected, problemName: Medium_074_Search_A_2D_Matrix_Test.ProblemName, input: input0, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Medium_074_Search_A_2D_Matrix_Test.TimeOut) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_074_Search_A_2D_Matrix_Test.ProblemName, input: input0, resultValue: Medium_074_Search_A_2D_Matrix_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
