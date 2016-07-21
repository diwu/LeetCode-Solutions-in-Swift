//
//  Medium_064_Minimum_Path_Sum_Test.swift
//  Solutions
//
//  Created by Di Wu on 7/10/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_064_Minimum_Path_Sum_Test: XCTestCase {
    private static let ProblemName: String = "Medium_064_Minimum_Path_Sum"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [[Int]] = [
            [0,0,0],
            [0,1,0],
            [0,0,0]
        ]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [[Int]] = [
        ]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [[Int]] = [
            [0,0,2],
            [0,1,0],
            [2,0,0]
        ]
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [[Int]] = [
            [1,5,2],
            [4,1,6],
            [2,0,0],
            [2,5,0]
        ]
        let expected: Int = 6
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [[Int]] = [
            [1,5,2,3],
            [4,1,6,1],
            [2,0,3,0],
            [2,5,0,3]
        ]
        let expected: Int = 12
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [[Int]], expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Medium_064_Minimum_Path_Sum_Test.TimeOutName)
        DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault).async(execute: { () -> Void in
            let result = Medium_064_Minimum_Path_Sum.minPathSum(input)
            assertHelper(result == expected, problemName: Medium_064_Minimum_Path_Sum_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Medium_064_Minimum_Path_Sum_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_064_Minimum_Path_Sum_Test.ProblemName, input: input, resultValue: Medium_064_Minimum_Path_Sum_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
