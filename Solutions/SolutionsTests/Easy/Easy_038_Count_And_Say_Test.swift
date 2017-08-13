//
//  Easy_038_Count_And_Say_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/15/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_038_Count_And_Say_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Easy_038_Count_And_Say"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: Int = 1
        let expected: String = "11"
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: Int = 8
        let expected: String = "31131211131221"
        asyncHelper(input: input, expected: expected)

    }
    func test_003() {
        let input: Int = 9
        let expected: String = "13211311123113112211"
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: Int, expected: String) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result: String = Easy_038_Count_And_Say.countAndSay(input)
            assertHelper(expected == result, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
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
