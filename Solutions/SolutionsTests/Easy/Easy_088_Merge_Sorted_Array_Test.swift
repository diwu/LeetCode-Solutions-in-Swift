//
//  Easy_088_Merge_Sorted_Array_Test.swift
//  Solutions
//
//  Created by Di Wu on 10/15/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Easy_088_Merge_Sorted_Array_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Easy_088_Merge_Sorted_Array"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        var input0: [Int] = [0]
        let input1: [Int] = [1]
        let m: Int = 0
        let n: Int = 1
        let expected: [Int] = [1]
        asyncHelper(input0: &input0, input1: input1, m: m, n: n, expected: expected)
    }
    func test_002() {
        var input0: [Int] = [1]
        let input1: [Int] = [0]
        let m: Int = 1
        let n: Int = 0
        let expected: [Int] = [1]
        asyncHelper(input0: &input0, input1: input1, m: m, n: n, expected: expected)
    }
    func test_003() {
        var input0: [Int] = [1, 3, 5, 7, 9, 0, 0, 0, 0, 0]
        let input1: [Int] = [2, 4, 6, 8, 10]
        let m: Int = 5
        let n: Int = 5
        let expected: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        asyncHelper(input0: &input0, input1: input1, m: m, n: n, expected: expected)
    }
    private func asyncHelper(input0: inout [Int], input1: [Int], m: Int, n: Int, expected: [Int]) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        var localInput0 = input0
        serialQueue().async(execute: { () -> Void in
            Easy_088_Merge_Sorted_Array.merge(nums1: &localInput0, m: m, nums2: input1, n: n)
            assertHelper(localInput0 == expected, problemName:self.problemName(), input: localInput0, resultValue: localInput0, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout:timeOut()) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: localInput0, resultValue:self.timeOutName(), expectedValue: expected)
            }
        }
    }
}
