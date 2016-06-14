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
        let input: [Int] = [-2 , 1, -3, 4, -1, 2, 1, -5, 4]
        let expected: Int = 6
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Int] = [-1]
        let expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Int] = [0]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [Int] = [1]
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [Int] = [-4, -2, -3, -5]
        let expected: Int = -2
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: [Int] = [1, 2, 3]
        let expected: Int = 6
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: [Int] = [1, 2, 3, -199, 999, -1000, 199]
        let expected: Int = 999
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        let input: [Int] = [1, 196, 3, -199, 999, -1000, 199]
        let expected: Int = 1000
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [Int], expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectation(withDescription: Medium_053_Maximum_Subarray_Test.TimeOutName)
        DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault).async(execute: { () -> Void in
            let result = Medium_053_Maximum_Subarray.maxSubArray(input)
            assertHelper(result == expected, problemName: Medium_053_Maximum_Subarray_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(withTimeout: Medium_053_Maximum_Subarray_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_053_Maximum_Subarray_Test.ProblemName, input: input, resultValue: Medium_053_Maximum_Subarray_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
