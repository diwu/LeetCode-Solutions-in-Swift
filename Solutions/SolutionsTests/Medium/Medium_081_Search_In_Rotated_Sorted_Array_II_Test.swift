//
//  Medium_081_Search_In_Rotated_Sorted_Array_II_Test.swift
//  Solutions
//
//  Created by Di Wu on 9/8/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_081_Search_In_Rotated_Sorted_Array_II_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Medium_081_Search_In_Rotated_Sorted_Array_II"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [Any] = [[4, 5, 6, 7, 0, 1, 2], 5]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Any] = [[4, 5, 6, 7, 0, 1, 2], 9]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Any] = [[4, 5, 6, 7, 0, 1, 2], 4]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [Any] = [[4, 5, 6, 7, 0, 1, 2], 2]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [Any] = [[1], 1]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: [Any] = [[1], 9]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: [Any] = [[1, 2, 3, 4, 5, 6, 7], 4]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        let input: [Any] = [[1, 2, 3, 4, 5, 6, 7], 1]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        let input: [Any] = [[1, 2, 3, 4, 5, 6, 7], 8]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_010() {
        let input: [Any] = [[1, 2, 3, 4, 5, 6, 7], 7]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_011() {
        let input: [Any] = [[1, 1], 1]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_012() {
        let input: [Any] = [[1, 1], 0]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_013() {
        let input: [Any] = [[1, 1, 2], 2]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_014() {
        let input: [Any] = [[2, 1, 1], 2]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_015() {
        let input: [Any] = [[2, 1, 1], 3]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_016() {
        let input: [Any] = [[4, 5, 5, 6, 7, 0, 0, 0, 1, 2], 3]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_017() {
        let input: [Any] = [[4, 5, 5, 6, 7, 0, 0, 0, 1, 2], 7]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_018() {
        let input: [Any] = [[4, 5, 5, 6, 7, 0, 0, 0, 1, 2], 5]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input ipt: [Any], expected: Bool) {
        var input = ipt
        weak var expectation: XCTestExpectation? = self.expectation(description: Medium_081_Search_In_Rotated_Sorted_Array_II_Test.TimeOutName)
        serialQueue().async(execute: { () -> Void in
            let result: Bool = Medium_081_Search_In_Rotated_Sorted_Array_II.search(nums: input[0] as! [Int], target: input[1] as! Int)
            assertHelper(expected == result, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Medium_081_Search_In_Rotated_Sorted_Array_II_Test.TimeOut) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input, resultValue: Medium_081_Search_In_Rotated_Sorted_Array_II_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
