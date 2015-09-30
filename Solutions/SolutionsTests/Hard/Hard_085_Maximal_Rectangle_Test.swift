//
//  Hard_085_Maximal_Rectangle_Test.swift
//  Solutions
//
//  Created by Di Wu on 9/30/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Hard_085_Maximal_Rectangle_Test: XCTestCase {
    private static let ProblemName: String = "Hard_085_Maximal_Rectangle"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [[Character]] = [
            ["0","0","0","1"],
            ["0","0","0","0"],
            ["1","1","0","0"],
            ["1","1","0","0"],
        ]
        let expected: Int = 4
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [[Character]] = [
            ["0","0","1","1"],
            ["0","0","1","0"],
            ["1","1","0","0"],
            ["1","1","0","0"],
        ]
        let expected: Int = 4
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [[Character]] = [
            ["0","0","1","1"],
            ["0","0","1","1"],
            ["1","1","0","0"],
            ["1","1","0","0"],
        ]
        let expected: Int = 4
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [[Character]] = [
            ["0","0","0","0"],
            ["0","0","0","0"],
            ["0","0","0","0"],
            ["0","0","0","0"],
        ]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [[Character]] = [
            ["0","0","0","0"],
            ["0","0","1","0"],
            ["0","0","0","0"],
            ["0","0","0","0"],
        ]
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: [[Character]] = [
        ]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: [[Character]] = [
            []
        ]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        let input: [[Character]] = [
            ["0","0","0","1","0","0","0"],
            ["0","0","1","1","1","0","0"],
            ["0","1","1","1","1","1","0"],
        ]
        let expected: Int = 6
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input input: [[Character]], expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Hard_085_Maximal_Rectangle_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            let result = Hard_085_Maximal_Rectangle.maximalRectangle(input)
            assertHelper(result == expected, problemName: Hard_085_Maximal_Rectangle_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Hard_085_Maximal_Rectangle_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Hard_085_Maximal_Rectangle_Test.ProblemName, input: input, resultValue: Hard_085_Maximal_Rectangle_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
