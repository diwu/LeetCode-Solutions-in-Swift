//
//  Medium_079_Word_Search_Test.swift
//  Solutions
//
//  Created by Di Wu on 8/13/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_079_Word_Search_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Medium_079_Word_Search"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input0: [[Character]] = [
            Array("ABCE".characters),
            Array("SFCS".characters),
            Array("ADEE".characters),
        ]
        let input1: String = "ABCCED"
        let expected: Bool = true
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_002() {
        let input0: [[Character]] = [
            Array("ABCE".characters),
            Array("SFCS".characters),
            Array("ADEE".characters),
        ]
        let input1: String = "SEE"
        let expected: Bool = true
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_003() {
        let input0: [[Character]] = [
            Array("ABCE".characters),
            Array("SFCS".characters),
            Array("ADEE".characters),
        ]
        let input1: String = "ABCB"
        let expected: Bool = false
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    private func asyncHelper(input0: [[Character]], input1: String, expected: Bool) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Medium_079_Word_Search_Test.TimeOutName)
        serialQueue().async(execute: { () -> Void in
            let result = Medium_079_Word_Search.exist(input0, word: input1)
            assertHelper(result == expected, problemName: Medium_079_Word_Search_Test.ProblemName, input: input1, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Medium_079_Word_Search_Test.TimeOut) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_079_Word_Search_Test.ProblemName, input: input1, resultValue: Medium_079_Word_Search_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
