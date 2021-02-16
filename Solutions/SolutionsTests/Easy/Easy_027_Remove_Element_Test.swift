//
//  Easy_027_Remove_Element_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/7/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_027_Remove_Element_Test: XCTestCase, SolutionsTestCase {
    func test_001() {
        let input: [Any] = [[1, 2, 2, 3], 2]
        let expected: [Int] = [1, 3]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Any] = [[1, 2, 3], 4]
        let expected: [Int] = [1, 2, 3]
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Any] = [[], 4]
        let expected: [Int] = []
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [Any] = [[1, 2, 2, 3, 6, 7, 6, 8, 1, 3, 2, 6], 6]
        let expected: [Int] = [1, 2, 2, 3, 7, 8, 1, 3, 2]
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [Any] = [[1], 1]
        let expected: [Int] = []
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input ipt: [Any], expected: [Int]) {
        let input = ipt
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            var arr: [Int] = input[0] as! [Int]
            let elem: Int = input[1] as! Int
            let result: Int = Easy_027_Remove_Element.removeElement(arr: &arr, elem: elem)
            assertHelper(expected == Array(arr[0..<result]), problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
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
