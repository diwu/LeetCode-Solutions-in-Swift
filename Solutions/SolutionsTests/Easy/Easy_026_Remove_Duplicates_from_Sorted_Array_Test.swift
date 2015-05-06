//
//  Easy_026_Remove_Duplicates_from_Sorted_Array_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/6/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_026_Remove_Duplicates_from_Sorted_Array_Test: XCTestCase {
    private static let ProblemName: String = "Easy_026_Remove_Duplicates_from_Sorted_Array"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value * 9999
    func test_001() {
        var input: [Int] = [1, 2, 2, 3]
        var expected: [Int] = [1, 2, 3]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        var input: [Int] = []
        var expected: [Int] = []
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        var input: [Int] = [1]
        var expected: [Int] = [1]
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        var input: [Int] = [1, 1, 1]
        var expected: [Int] = [1]
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        var input: [Int] = [1, 1, 2]
        var expected: [Int] = [1, 2]
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        var input: [Int] = [1, 2, 2]
        var expected: [Int] = [1, 2]
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        var input: [Int] = [1, 2, 3, 4]
        var expected: [Int] = [1, 2, 3, 4]
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        var input: [Int] = [1, 1, 1, 1, 2, 3, 3, 3, 3, 4, 5, 5, 5, 5]
        var expected: [Int] = [1, 2, 3, 4, 5]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(var # input: [Int], expected: [Int]) {
        var expectation: XCTestExpectation = self.expectationWithDescription(Easy_026_Remove_Duplicates_from_Sorted_Array_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result: Int = Easy_026_Remove_Duplicates_from_Sorted_Array.removeDuplicates(&input)
            assertHelper(expected == Array(input[0..<result]), problemName: Easy_026_Remove_Duplicates_from_Sorted_Array_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            expectation.fulfill()
        })
        waitForExpectationsWithTimeout(Easy_026_Remove_Duplicates_from_Sorted_Array_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Easy_026_Remove_Duplicates_from_Sorted_Array_Test.ProblemName, input: input, resultValue: Easy_026_Remove_Duplicates_from_Sorted_Array_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
