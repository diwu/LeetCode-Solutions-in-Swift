//
//  Medium_075_Sort_Colors_Test.swift
//  Solutions
//
//  Created by Di Wu on 7/30/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_075_Sort_Colors_Test: XCTestCase, SolutionsTestCase {
    func test_001() {
        var input: [Int] = [2, 1, 1, 2, 2, 1, 0, 0, 1, 2]
        let expected: [Int] = [0, 0, 1, 1, 1, 1, 2, 2, 2, 2]
        asyncHelper(input: &input, expected: expected)
    }
    private func asyncHelper(input: inout [Int], expected: [Int]) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        var localInput = input
        serialQueue().async(execute: { () -> Void in
            Medium_075_Sort_Colors.sortColors(&localInput)
            let result = localInput
            assertHelper(result == expected, problemName:self.problemName(), input: localInput, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout:timeOut()) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: localInput, resultValue:self.timeOutName(), expectedValue: expected)
            }
        }
    }
}
