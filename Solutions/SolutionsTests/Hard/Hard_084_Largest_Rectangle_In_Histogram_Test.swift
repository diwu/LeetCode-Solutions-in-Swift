//
//  Hard_084_Largest_Rectangle_In_Histogram_Test.swift
//  Solutions
//
//  Created by Di Wu on 9/30/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Hard_084_Largest_Rectangle_In_Histogram_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Hard_084_Largest_Rectangle_In_Histogram"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [Int] = [2,1,5,6,2,3]
        let expected: Int = 10
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Int] = []
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Int] = [7,4]
        let expected: Int = 8
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [Int] = [6, 2, 5, 4, 5, 1, 6]
        let expected: Int = 12
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [Int] = [1, 3, 5, 8, 5, 4, 6, 7, 5, 2, 1, 0]
        let expected: Int = 28
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: [Int] = [3,2,3]
        let expected: Int = 6
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: [Int] = [6, 2, 5, 4, 5, 2, 6]
        let expected: Int = 14
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [Int], expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Hard_084_Largest_Rectangle_In_Histogram_Test.TimeOutName)
        serialQueue().async(execute: { () -> Void in
            let result = Hard_084_Largest_Rectangle_In_Histogram.largestRectangleArea(input)
            assertHelper(result == expected, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout:timeOut()) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input, resultValue: Hard_084_Largest_Rectangle_In_Histogram_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
