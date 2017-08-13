//
//  Easy_026_Remove_Duplicates_from_Sorted_Array_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/6/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_026_Remove_Duplicates_from_Sorted_Array_Test: XCTestCase, SolutionsTestCase {
    func test_001() {
        let input: [Int] = [1, 2, 2, 3]
        let expected: [Int] = [1, 2, 3]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Int] = []
        let expected: [Int] = []
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Int] = [1]
        let expected: [Int] = [1]
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [Int] = [1, 1, 1]
        let expected: [Int] = [1]
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [Int] = [1, 1, 2]
        let expected: [Int] = [1, 2]
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: [Int] = [1, 2, 2]
        let expected: [Int] = [1, 2]
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: [Int] = [1, 2, 3, 4]
        let expected: [Int] = [1, 2, 3, 4]
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        let input: [Int] = [1, 1, 1, 1, 2, 3, 3, 3, 3, 4, 5, 5, 5, 5]
        let expected: [Int] = [1, 2, 3, 4, 5]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input ipt: [Int], expected: [Int]) {
        var input = ipt
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result: Int = Easy_026_Remove_Duplicates_from_Sorted_Array.removeDuplicates(&input)
            assertHelper(expected == Array(input[0..<result]), problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout:timeOut()) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input, resultValue:self.timeOutName(), expectedValue: expected)
            }
        }
    }
}
