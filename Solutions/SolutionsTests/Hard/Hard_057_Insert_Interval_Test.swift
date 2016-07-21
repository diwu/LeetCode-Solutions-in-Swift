//
//  Hard_057_Insert_Interval_Test.swift
//  Solutions
//
//  Created by Di Wu on 6/13/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Hard_057_Insert_Interval_Test: XCTestCase {
    private static let ProblemName: String = "Hard_057_Insert_Interval"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input0: [[Int]] = [
            [1,3],
            [6,9]
        ]
        let input1: [Int] = [
             2,5
        ]
        let expected: [[Int]] = [
            [1,5],
            [6,9]
        ]
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_002() {
        let input0: [[Int]] = [
            [1,2],
            [3,5],
            [6,7],
            [8,10],
            [12,16]
        ]
        let input1: [Int] = [
            4,9
        ]
        let expected: [[Int]] = [
            [1,2],
            [3,10],
            [12,16]
        ]
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_003() {
        let input0: [[Int]] = [
        ]
        let input1: [Int] = [
        ]
        let expected: [[Int]] = [
            []
        ]
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_004() {
        let input0: [[Int]] = [
            [1,2],
            [3,5],
            [6,7],
            [8,10],
            [12,16]
        ]
        let input1: [Int] = [
            1,16
        ]
        let expected: [[Int]] = [
            [1,16]
        ]
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_005() {
        let input0: [[Int]] = [
            [1,2],
            [3,5],
            [6,7],
            [8,10],
            [12,16]
        ]
        let input1: [Int] = [
            2,15
        ]
        let expected: [[Int]] = [
            [1,16]
        ]
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_006() {
        let input0: [[Int]] = [
            [1,2],
            [3,5],
            [6,7],
            [8,10],
            [12,16]
        ]
        let input1: [Int] = [
            2,17
        ]
        let expected: [[Int]] = [
            [1,17]
        ]
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_007() {
        let input0: [[Int]] = [
            [1,2],
            [3,5],
            [6,7],
            [8,10],
            [99,100]
        ]
        let input1: [Int] = [
            200, 202
        ]
        let expected: [[Int]] = [
            [1,2],
            [3,5],
            [6,7],
            [8,10],
            [99,100],
            [200,202]
        ]
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_008() {
        let input0: [[Int]] = [
            [3,5],
            [6,7],
            [8,10],
            [99,100]
        ]
        let input1: [Int] = [
             1,2
        ]
        let expected: [[Int]] = [
            [1,2],
            [3,5],
            [6,7],
            [8,10],
            [99,100],
        ]
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_009() {
        let input0: [[Int]] = [
            [3,5],
            [6,7],
            [8,10],
            [99,100]
        ]
        let input1: [Int] = [
            80,81
        ]
        let expected: [[Int]] = [
            [3,5],
            [6,7],
            [8,10],
            [80,81],
            [99,100]
        ]
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    private func asyncHelper(input0: [[Int]], input1: [Int], expected: [[Int]]) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Hard_057_Insert_Interval_Test.TimeOutName)
        DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault).async(execute: { () -> Void in
            let result = Hard_057_Insert_Interval.insert(intervals: input0, newInterval: input1)
            assertHelper(result == expected, problemName: Hard_057_Insert_Interval_Test.ProblemName, input: [input0, input1], resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Hard_057_Insert_Interval_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Hard_057_Insert_Interval_Test.ProblemName, input: [input0, input1], resultValue: Hard_057_Insert_Interval_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
