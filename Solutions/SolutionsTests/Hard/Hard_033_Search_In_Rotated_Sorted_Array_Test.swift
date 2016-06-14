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
        let input: [AnyObject] = [[4, 5, 6, 7, 0, 1, 2], 5]
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [AnyObject] = [[4, 5, 6, 7, 0, 1, 2], 9]
        let expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [AnyObject] = [[4, 5, 6, 7, 0, 1, 2], 4]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [AnyObject] = [[4, 5, 6, 7, 0, 1, 2], 2]
        let expected: Int = 6
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [AnyObject] = [[1], 1]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: [AnyObject] = [[1], 9]
        let expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: [AnyObject] = [[1, 2, 3, 4, 5, 6, 7], 4]
        let expected: Int = 3
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        let input: [AnyObject] = [[1, 2, 3, 4, 5, 6, 7], 1]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        let input: [AnyObject] = [[1, 2, 3, 4, 5, 6, 7], 8]
        let expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_010() {
        let input: [AnyObject] = [[1, 2, 3, 4, 5, 6, 7], 7]
        let expected: Int = 6
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input ipt: [AnyObject], expected: Int) {
        var input = ipt
        weak var expectation: XCTestExpectation? = self.expectation(withDescription: Hard_033_Search_In_Rotated_Sorted_Array_Test.TimeOutName)
        DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault).async(execute: { () -> Void in
            let result: Int = Hard_033_Search_In_Rotated_Sorted_Array.search(nums: input[0] as! [Int], target: input[1] as! Int)
            assertHelper(expected == result, problemName: Hard_033_Search_In_Rotated_Sorted_Array_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(withTimeout: Hard_033_Search_In_Rotated_Sorted_Array_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Hard_033_Search_In_Rotated_Sorted_Array_Test.ProblemName, input: input, resultValue: Hard_033_Search_In_Rotated_Sorted_Array_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
