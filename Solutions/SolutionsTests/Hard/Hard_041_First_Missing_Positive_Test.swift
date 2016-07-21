//
//  Hard_041_First_Missing_Positive_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/20/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Hard_041_First_Missing_Positive_Test: XCTestCase {
    private static let ProblemName: String = "Hard_041_First_Missing_Positive"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [Int] = [1, 2, 0]
        let expected: Int = 3
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Int] = [3,4,-1,1]
        let expected: Int = 2
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Int] = []
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [Int] = [-999]
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [Int] = [9, 8, 7, 6, 5, 4, 3, 2, 1]
        let expected: Int = 10
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: [Int] = [9, 8, 7, 6, 5, 4, 3, 2]
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        let expected: Int = 10
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        let input: [Int] = [2, 3, 4, 5, 6, 7, 8, 9]
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        let input: [Int] = [1, 1, 1, 0, -1, -2, 2, 9, 8, 3, 5, 4, 4, 1, 1, 6, -2, -9, 7, 7, 7]
        let expected: Int = 10
        asyncHelper(input: input, expected: expected)
    }
    func test_010() {
        let input: [Int] = [1, 1, 1, 0, -1, -2, 2, 9, 8, 5, 4, 4, 1, 1, 6, -2, -9, 7, 7, 7]
        let expected: Int = 3
        asyncHelper(input: input, expected: expected)
    }
    func test_011() {
        let input: [Int] = [1, 1, 1, 1]
        let expected: Int = 2
        asyncHelper(input: input, expected: expected)
    }
    func test_012() {
        let input: [Int] = [-1, -1, -1, -1]
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_013() {
        let input: [Int] = [2, 2, 2, 2]
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [Int], expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Hard_041_First_Missing_Positive_Test.TimeOutName)
        DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault).async(execute: { () -> Void in
            let result: Int = Hard_041_First_Missing_Positive.firstMissingPositive(input)
            assertHelper(expected == result, problemName: Hard_041_First_Missing_Positive_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Hard_041_First_Missing_Positive_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Hard_041_First_Missing_Positive_Test.ProblemName, input: input, resultValue: Hard_041_First_Missing_Positive_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
