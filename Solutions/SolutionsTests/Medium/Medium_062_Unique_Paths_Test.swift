//
//  Medium_062_Unique_Paths_Test.swift
//  Solutions
//
//  Created by Di Wu on 7/2/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_062_Unique_Paths_Test: XCTestCase, SolutionsTestCase {
    func test_001() {
        let input: [Int] = [3, 7]
        let expected: Int = 28
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Int] = [10, 20]
        let expected: Int = 6906900
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [Int], expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result = Medium_062_Unique_Paths.uniquePaths(m: input[0], n: input[1])
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
