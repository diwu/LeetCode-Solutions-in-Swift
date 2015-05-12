//
//  Medium_034_Search_For_A_Range_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/12/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_034_Search_For_A_Range_Test: XCTestCase {
    private static let ProblemName: String = "Medium_034_Search_For_A_Range"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        var input: [AnyObject] = [[5, 7, 7, 8, 8, 10], 8]
        var expected: [Int] = [3, 4]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        var input: [AnyObject] = [[5, 7, 7, 8, 8, 10], 11]
        var expected: [Int] = [-1, -1]
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        var input: [AnyObject] = [[5, 7, 7, 8, 8, 10], 10]
        var expected: [Int] = [5, 5]
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        var input: [AnyObject] = [[5, 7, 7, 8, 8, 10], 5]
        var expected: [Int] = [0, 0]
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        var input: [AnyObject] = [[1], 9]
        var expected: [Int] = [-1, -1]
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        var input: [AnyObject] = [[1], 0]
        var expected: [Int] = [-1, -1]
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        var input: [AnyObject] = [[1, 1], 0]
        var expected: [Int] = [-1, -1]
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        var input: [AnyObject] = [[1, 1], 1]
        var expected: [Int] = [0, 1]
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        var input: [AnyObject] = [[1], 1]
        var expected: [Int] = [0, 0]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(var # input: [AnyObject], expected: [Int]) {
        var expectation: XCTestExpectation = self.expectationWithDescription(Medium_034_Search_For_A_Range_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result: [Int] = Medium_034_Search_For_A_Range.searchRange(nums: input[0] as! [Int], target: input[1] as! Int)
            assertHelper(expected == result, problemName: Medium_034_Search_For_A_Range_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            expectation.fulfill()
        })
        waitForExpectationsWithTimeout(Medium_034_Search_For_A_Range_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_034_Search_For_A_Range_Test.ProblemName, input: input, resultValue: Medium_034_Search_For_A_Range_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
