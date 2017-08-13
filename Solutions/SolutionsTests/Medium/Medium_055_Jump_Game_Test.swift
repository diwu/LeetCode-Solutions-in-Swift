//
//  Medium_055_Jump_Game_Test.swift
//  Solutions
//
//  Created by Di Wu on 6/6/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_055_Jump_Game_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Medium_055_Jump_Game"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [Int] = [2,3,1,1,4]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Int] = [3,2,1,0,4]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Int] = [0]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [Int] = [0, 1]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [Int] = [1, 0]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: [Int] = [4,2,1,0,4]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [Int], expected: Bool) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Medium_055_Jump_Game_Test.TimeOutName)
        serialQueue().async(execute: { () -> Void in
            let result = Medium_055_Jump_Game.canJump(input)
            assertHelper(result == expected, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout:timeOut()) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input, resultValue: Medium_055_Jump_Game_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
