//
//  Medium_031_Next_Permutation_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/10/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_031_Next_Permutation_Test: XCTestCase {
    private static let ProblemName: String = "Medium_031_Next_Permutation"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        var input: [Int] = [1, 2, 3]
        var expected: [Int] = [1, 3, 2]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        var input: [Int] = [3, 2, 1]
        var expected: [Int] = [1, 2, 3]
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        var input: [Int] = [1, 1, 5]
        var expected: [Int] = [1, 5, 1]
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        var input: [Int] = [1, 2]
        var expected: [Int] = [2, 1]
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        var input: [Int] = [1]
        var expected: [Int] = [1]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(var # input: [Int], expected: [Int]) {
        var expectation: XCTestExpectation = self.expectationWithDescription(Medium_031_Next_Permutation_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result: [Int] = input
            Medium_031_Next_Permutation.nextPermutation(&result)
            assertHelper(expected == result, problemName: Medium_031_Next_Permutation_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            expectation.fulfill()
        })
        waitForExpectationsWithTimeout(Medium_031_Next_Permutation_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_031_Next_Permutation_Test.ProblemName, input: input, resultValue: Medium_031_Next_Permutation_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
