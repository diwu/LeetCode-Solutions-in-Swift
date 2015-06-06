//
//  Medium_055_Jump_Game_Test.swift
//  Solutions
//
//  Created by Di Wu on 6/6/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_055_Jump_Game_Test: XCTestCase {
    private static let ProblemName: String = "Medium_055_Jump_Game"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        var input: [Int] = [2,3,1,1,4]
        var expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        var input: [Int] = [3,2,1,0,4]
        var expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        var input: [Int] = [0]
        var expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        var input: [Int] = [0, 1]
        var expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        var input: [Int] = [1, 0]
        var expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        var input: [Int] = [4,2,1,0,4]
        var expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(# input: [Int], expected: Bool) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Medium_055_Jump_Game_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result = Medium_055_Jump_Game.canJump(input)
            assertHelper(result == expected, problemName: Medium_055_Jump_Game_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Medium_055_Jump_Game_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_055_Jump_Game_Test.ProblemName, input: input, resultValue: Medium_055_Jump_Game_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
