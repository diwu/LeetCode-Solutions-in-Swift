//
//  Medium_035_Search_Insert_Position_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/12/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_035_Search_Insert_Position_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Medium_035_Search_Insert_Position"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [Any] = [[1,3,5,6], 5]
        let expected: Int = 2
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Any] = [[1,3,5,6], 2]
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Any] = [[1,3,5,6], 7]
        let expected: Int = 4
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [Any] = [[1,3,5,6], 0]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [Any] = [[], 999]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: [Any] = [[1], 1]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: [Any] = [[1], 0]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        let input: [Any] = [[1], 2]
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        let input: [Any] = [[1,3,5,6], 1]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_010() {
        let input: [Any] = [[1,3,5,6], 6]
        let expected: Int = 3
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input ipt: [Any], expected: Int) {
        var input = ipt
        weak var expectation: XCTestExpectation? = self.expectation(description: Medium_035_Search_Insert_Position_Test.TimeOutName)
        serialQueue().async(execute: { () -> Void in
            let result: Int = Medium_035_Search_Insert_Position.searchInsert(nums: input[0] as! [Int], target: input[1] as! Int)
            assertHelper(expected == result, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout:timeOut()) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input, resultValue: Medium_035_Search_Insert_Position_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
