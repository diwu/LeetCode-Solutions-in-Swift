//
//  Medium_055_Jump_Game_Test.swift
//  Solutions
//
//  Created by Di Wu on 6/6/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_055_Jump_Game_Test: XCTestCase, SolutionsTestCase {
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
    func test_007() {
        let input: [Int] = [3,2,2,0,4]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        let input: [Int] = [2, 8, 0, 0, 0, 0]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        let input: [Int] = [2, 0]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_010() {
        let input: [Int] = [0, 2, 1]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    
    private func asyncHelper(input: [Int], expected: Bool) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result = Medium_055_Jump_Game.canJump(input)
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
