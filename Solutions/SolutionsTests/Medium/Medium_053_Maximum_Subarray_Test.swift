//
//  Medium_053_Maximum_Subarray_Test.swift
//  Solutions
//
//  Created by Di Wu on 6/6/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_053_Maximum_Subarray_Test: XCTestCase {
    private static let ProblemName: String = "Medium_053_Maximum_Subarray"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        var input: [Int] = [-2 , 1, -3, 4, -1, 2, 1, -5, 4]
        var expected: Int = 6
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        var input: [Int] = [-1]
        var expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        var input: [Int] = [0]
        var expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        var input: [Int] = [1]
        var expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        var input: [Int] = [-4, -2, -3, -5]
        var expected: Int = -2
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        var input: [Int] = [1, 2, 3]
        var expected: Int = 6
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        var input: [Int] = [1, 2, 3, -199, 999, -1000, 199]
        var expected: Int = 999
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        var input: [Int] = [1, 196, 3, -199, 999, -1000, 199]
        var expected: Int = 1000
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(# input: [Int], expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Medium_053_Maximum_Subarray_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result = Medium_053_Maximum_Subarray.maxSubArray(input)
            assertHelper(result == expected, problemName: Medium_053_Maximum_Subarray_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Medium_053_Maximum_Subarray_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_053_Maximum_Subarray_Test.ProblemName, input: input, resultValue: Medium_053_Maximum_Subarray_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
