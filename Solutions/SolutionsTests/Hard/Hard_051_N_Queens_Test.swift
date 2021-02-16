//
//  Hard_051_N_Queens_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/23/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Hard_051_N_Queens_Test: XCTestCase, SolutionsTestCase {
    func test_001() {
        let input: Int = 4
        let expected: [[String]] = [
            [
                ".Q..",
                "...Q",
                "Q...",
                "..Q."
            ],[
                "..Q.",
                "Q...",
                "...Q",
                ".Q.."
            ]
        ]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: Int, expected: [[String]]) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result = Hard_051_N_Queens.solveNQueens(input)
            if result.count != expected.count {
                assertHelper(false, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
            } else {
                for i in 0 ..< expected.count {
                    var flag = false
                    for j in 0 ..< result.count {
                        if result[j] == expected[i] {
                            flag = true
                        }
                    }
                    if flag == false {
                        assertHelper(false, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
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
