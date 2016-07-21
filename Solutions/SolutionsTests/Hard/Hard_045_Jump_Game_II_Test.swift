//
//  Hard_045_Jump_Game_II_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/23/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Hard_045_Jump_Game_II_Test: XCTestCase {
    private static let ProblemName: String = "Hard_045_Jump_Game_II"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [Int] = [2, 3, 1, 1, 4]
        let expected: Int = 2
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Int] = [1]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Int] = [1, 1, 1]
        let expected: Int = 2
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [Int] = [9, 8, 1, 3, 6, 7, 7, 1,9, 8, 8, 5, 6, 7, 1]
        let expected: Int = 2
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [Int] = [1, 1, 1, 3, 6, 7, 7, 1,9, 8, 8, 5, 6, 7, 1]
        let expected: Int = 6
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [Int], expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Hard_045_Jump_Game_II_Test.TimeOutName)
        DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault).async(execute: { () -> Void in
            let result = Hard_045_Jump_Game_II.jump(input)
            assertHelper(result == expected, problemName: Hard_045_Jump_Game_II_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Hard_045_Jump_Game_II_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Hard_045_Jump_Game_II_Test.ProblemName, input: input, resultValue: Hard_045_Jump_Game_II_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
