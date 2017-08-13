//
//  Medium_090_Subsets_II_Test.swift
//  Solutions
//
//  Created by Di Wu on 10/22/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_090_Subsets_II_Test: XCTestCase, SolutionsTestCase {
    func test_001() {
        let input: [Int] = [1, 2, 3]
        let expected: [[Int]] = [
            [3],
            [1],
            [2],
            [1,2,3],
            [1,3],
            [2,3],
            [1,2],
            []
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Int] = []
        let expected: [[Int]] = [
            []
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Int] = [1]
        let expected: [[Int]] = [
            [],
            [1]
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [Int] = [1, 2]
        let expected: [[Int]] = [
            [],
            [1],
            [2],
            [1,2]
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [Int] = [1, 2, 2]
        let expected: [[Int]] = [
            [2],
            [1],
            [1,2,2],
            [2,2],
            [1,2],
            []
        ]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [Int], expected: [[Int]]) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result = Medium_090_Subsets_II.subsetsWithDup(input)
            let resultSet: NSSet = NSSet(array: result)
            let expectedSet: NSSet = NSSet(array: expected)
            assertHelper(resultSet == expectedSet, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
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
