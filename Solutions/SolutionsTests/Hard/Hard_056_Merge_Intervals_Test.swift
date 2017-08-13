//
//  Hard_056_Merge_Intervals_Test.swift
//  Solutions
//
//  Created by Di Wu on 6/10/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Hard_056_Merge_Intervals_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Hard_056_Merge_Intervals"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [[Int]] = [
            [1,3],
            [2,6],
            [8,10],
            [15,18]
        ]
        let expected: [[Int]] = [
            [1,6],
            [8,10],
            [15,18]
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [[Int]] = [
        ]
        let expected: [[Int]] = [
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [[Int]] = [
            [1,3],
            [2,6],
            [8,10],
            [15,18],
            [1, 1],
            [11, 11],
            [99, 100],
            [98, 101],
            [96, 97]
        ]
        let expected: [[Int]] = [
            [1,6],
            [8,10],
            [11, 11],
            [15,18],
            [96, 97],
            [98, 101]
        ]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [[Int]], expected: [[Int]]) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Hard_056_Merge_Intervals_Test.TimeOutName)
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async(execute: { () -> Void in
            let result = Hard_056_Merge_Intervals.merge(input)
            assertHelper(compareTwoDimensionIntArray(arr0: result, arr1: expected), problemName: Hard_056_Merge_Intervals_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Hard_056_Merge_Intervals_Test.TimeOut) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Hard_056_Merge_Intervals_Test.ProblemName, input: input, resultValue: Hard_056_Merge_Intervals_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
