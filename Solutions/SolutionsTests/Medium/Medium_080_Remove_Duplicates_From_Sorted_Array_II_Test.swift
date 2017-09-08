//
//  Medium_080_Remove_Duplicates_From_Sorted_Array_II_Test.swift
//  Solutions
//
//  Created by Di Wu on 8/31/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_080_Remove_Duplicates_From_Sorted_Array_II_Test: XCTestCase, SolutionsTestCase {
    func test_001() {
        let input: [Int] = [1,1,1,2,2,3]
        let expected: [[Int]] = [[5], [1,1,2,2,3]]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Int] = [1]
        let expected: [[Int]] = [[1], [1]]
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Int] = [1, 1]
        let expected: [[Int]] = [[2], [1, 1]]
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [Int] = [1,1,2,2,3]
        let expected: [[Int]] = [[5], [1,1,2,2,3]]
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [Int] = [1,2,3,4,5]
        let expected: [[Int]] = [[5], [1,2,3,4,5]]
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: [Int] = []
        let expected: [[Int]] = [[0], []]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input ipt: [Int], expected: [[Int]] ) {
        var input = ipt
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let len = Medium_080_Remove_Duplicates_From_Sorted_Array_II.removeDuplicates(&input)
            let result = input
            assertHelper(len == expected[0][0], problemName:self.problemName(), input: input, resultValue: [[len], result], expectedValue: expected)
            for i in 0 ..< expected[1].count {
                assertHelper(result[i] == expected[1][i], problemName:self.problemName(), input: input, resultValue: [[len], result], expectedValue: expected)
            }
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
