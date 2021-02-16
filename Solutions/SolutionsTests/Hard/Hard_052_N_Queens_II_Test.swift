//
//  Hard_052_N_Queens_II_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/26/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Hard_052_N_Queens_II_Test: XCTestCase, SolutionsTestCase {
    func test_001() {
        let expected: [Int] = [0, 1, 0, 0, 2, 10, 4, 40, 92, 352, 724, 2680, 14200, 73712, 365596, 2279184, 14772512, 95815104, 666090624]
        for i in 0 ..< 14 {
            asyncHelper(input: i, expected: expected[i])
        }
    }
    private func asyncHelper(input: Int, expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result = Hard_052_N_Queens_II.totalNQueens(input)
            assertHelper(result == expected, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
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
