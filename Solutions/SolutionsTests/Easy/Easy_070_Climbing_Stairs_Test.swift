//
//  Easy_070_Climbing_Stairs_Test.swift
//  Solutions
//
//  Created by Di Wu on 7/24/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Easy_070_Climbing_Stairs_Test: XCTestCase {
    private static let ProblemName: String = "Easy_070_Climbing_Stairs"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: Int = 0
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: Int = 1
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: Int = 2
        let expected: Int = 2
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: Int = 3
        let expected: Int = 3
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: Int = 4
        let expected: Int = 5
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: Int = 5
        let expected: Int = 8
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: Int = 6
        let expected: Int = 13
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: Int, expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Easy_070_Climbing_Stairs_Test.TimeOutName)
        DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault).async(execute: { () -> Void in
            let result = Easy_070_Climbing_Stairs.climbStairs(input)
            assertHelper(result == expected, problemName: Easy_070_Climbing_Stairs_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Easy_070_Climbing_Stairs_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Easy_070_Climbing_Stairs_Test.ProblemName, input: input, resultValue: Easy_070_Climbing_Stairs_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
