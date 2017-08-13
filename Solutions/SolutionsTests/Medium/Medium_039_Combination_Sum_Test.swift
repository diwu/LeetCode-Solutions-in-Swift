//
//  Medium_039_Combination_Sum_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/17/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_039_Combination_Sum_Test: XCTestCase, SolutionsTestCase {
    func test_001() {
        let input: [Any] = [[2, 3, 6, 7], 7]
        let expected: [[Int]] = [[7], [2, 2, 3]]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Any] = [[9], 1]
        let expected: [[Int]] = []
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Any] = [[1, 2, 3], 6]
        let expected: [[Int]] = [[1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 2], [1, 1, 1, 3], [1, 1, 2, 2], [1, 2, 3], [2, 2, 2], [3, 3]]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [Any], expected: [[Int]]) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            var result: [[Int]] = Medium_039_Combination_Sum.combinationSum(candidates: input[0] as! [Int], target: input[1] as! Int)
            if result.count != expected.count {
                assertHelper(false, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
            } else {
                for i in 0 ..< expected.count {
                    var flag: Bool = false
                    for j in 0 ..< result.count {
                        if expected[i] == result[j] {
                            flag = true
                        }
                    }
                    if flag == false {
                        assertHelper(false, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
                        return
                    }
                }
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
