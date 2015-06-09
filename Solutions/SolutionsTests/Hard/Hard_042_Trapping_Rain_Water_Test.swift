//
//  Hard_042_Trapping_Rain_Water_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/22/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Hard_042_Trapping_Rain_Water_Test: XCTestCase {
    private static let ProblemName: String = "Hard_042_Trapping_Rain_Water"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [Int] = [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]
        let expected: Int = 6
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Int] = []
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Int] = [999]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [Int] = [1, 999]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [Int] = [1, 0, 2, 0, 0]
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: [Int] = [1, 0, 2, 0, 0, 999, 998, 2, 4, 0, 0]
        let expected: Int = 7
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: [Int] = [1, 0, 1, 0, 0, 999, 998, 2, 4, 0, 0]
        let expected: Int = 5
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input  input: [Int], expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Hard_042_Trapping_Rain_Water_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result: Int = Hard_042_Trapping_Rain_Water.trap(input)
            assertHelper(expected == result, problemName: Hard_042_Trapping_Rain_Water_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Hard_042_Trapping_Rain_Water_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Hard_042_Trapping_Rain_Water_Test.ProblemName, input: input, resultValue: Hard_042_Trapping_Rain_Water_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
