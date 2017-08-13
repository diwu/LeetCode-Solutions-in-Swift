//
//  Medium_096_Unique_Binary_Search_Trees_Test.swift
//  Solutions
//
//  Created by Di Wu on 12/8/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_096_Unique_Binary_Search_Trees_Test: XCTestCase, SolutionsTestCase {
    func test_001() {
        let input: Int = 1
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: Int = 3
        let expected: Int = 5
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: Int = 2
        let expected: Int = 2
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: Int, expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result_swift: Int = Medium_096_Unique_Binary_Search_Trees.numTrees(input)
            let result_objc: Int = ObjC_Medium_096_Unique_Binary_Search_Trees.numTrees(input)
            assertHelper(expected == result_swift, problemName:self.problemName(), input: input, resultValue: result_swift, expectedValue: expected)
            assertHelper(expected == result_objc, problemName:self.problemName(), input: input, resultValue: result_objc, expectedValue: expected)
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
