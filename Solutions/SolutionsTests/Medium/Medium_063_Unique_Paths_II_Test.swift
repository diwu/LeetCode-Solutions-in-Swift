//
//  Medium_063_Unique_Paths_II_Test.swift
//  Solutions
//
//  Created by Di Wu on 7/10/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_063_Unique_Paths_II_Test: XCTestCase {
    private static let ProblemName: String = "Medium_063_Unique_Paths_II"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [[Int]] = [
            [0,0,0],
            [0,1,0],
            [0,0,0]
        ]
        let expected: Int = 2
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [[Int]] = [
            [0,0,0,0],
            [0,1,0,0],
            [0,0,0,0]
        ]
        let expected: Int = 4
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [[Int]] = [
            [0,0,0,0],
            [0,1,0,0],
            [0,0,0,1],
            [0,0,0,0],
        ]
        let expected: Int = 4
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [[Int]] = [
        ]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [[Int]] = [
            [0,0,0,0],
            [0,1,0,0],
            [0,0,0,1],
            [0,0,0,0],
            [1,0,0,0],
        ]
        let expected: Int = 10
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [[Int]], expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Medium_063_Unique_Paths_II_Test.TimeOutName)
        DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault).async(execute: { () -> Void in
            let result = Medium_063_Unique_Paths_II.uniquePathsWithObstacles(input)
            assertHelper(result == expected, problemName: Medium_063_Unique_Paths_II_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Medium_063_Unique_Paths_II_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_063_Unique_Paths_II_Test.ProblemName, input: input, resultValue: Medium_063_Unique_Paths_II_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
