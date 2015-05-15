//
//  Hard_033_Search_In_Rotated_Sorted_Array_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/11/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Hard_033_Search_In_Rotated_Sorted_Array_Test: XCTestCase {
    private static let ProblemName: String = "Hard_033_Search_In_Rotated_Sorted_Array"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        var input: [AnyObject] = [[4, 5, 6, 7, 0, 1, 2], 5]
        var expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        var input: [AnyObject] = [[4, 5, 6, 7, 0, 1, 2], 9]
        var expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        var input: [AnyObject] = [[4, 5, 6, 7, 0, 1, 2], 4]
        var expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        var input: [AnyObject] = [[4, 5, 6, 7, 0, 1, 2], 2]
        var expected: Int = 6
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        var input: [AnyObject] = [[1], 1]
        var expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        var input: [AnyObject] = [[1], 9]
        var expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        var input: [AnyObject] = [[1, 2, 3, 4, 5, 6, 7], 4]
        var expected: Int = 3
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        var input: [AnyObject] = [[1, 2, 3, 4, 5, 6, 7], 1]
        var expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        var input: [AnyObject] = [[1, 2, 3, 4, 5, 6, 7], 8]
        var expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_010() {
        var input: [AnyObject] = [[1, 2, 3, 4, 5, 6, 7], 7]
        var expected: Int = 6
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(var # input: [AnyObject], expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Hard_033_Search_In_Rotated_Sorted_Array_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result: Int = Hard_033_Search_In_Rotated_Sorted_Array.search(nums: input[0] as! [Int], target: input[1] as! Int)
            assertHelper(expected == result, problemName: Hard_033_Search_In_Rotated_Sorted_Array_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Hard_033_Search_In_Rotated_Sorted_Array_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Hard_033_Search_In_Rotated_Sorted_Array_Test.ProblemName, input: input, resultValue: Hard_033_Search_In_Rotated_Sorted_Array_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
