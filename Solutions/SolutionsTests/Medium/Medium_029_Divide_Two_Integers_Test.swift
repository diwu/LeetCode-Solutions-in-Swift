//
//  Medium_029_Divide_Two_Integers_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/9/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_029_Divide_Two_Integers_Test: XCTestCase {
    private static let ProblemName: String = "Medium_029_Divide_Two_Integers"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [Int] = [3, 1]
        let expected: Int = 3
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Int] = [-1, 1]
        let expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Int] = [11, 3]
        let expected: Int = 3
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [Int] = [999, 0]
        let expected: Int = Int.max
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [Int] = [-999, 0]
        let expected: Int = Int.max
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: [Int] = [Int.min, -1]
        let expected: Int = Int.max
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: [Int] = [Int.max, -1]
        let expected: Int = 0 - Int.max
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        let input: [Int] = [Int.max, -2]
        let expected: Int = Int.max / (-2)
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        let input: [Int] = [Int.min, -999]
        let expected: Int = Int.min / (-999)
        asyncHelper(input: input, expected: expected)
    }
    func test_010() {
        let input: [Int] = [Int.max, 1]
        let expected: Int = Int.max
        asyncHelper(input: input, expected: expected)
    }
    func test_011() {
        let input: [Int] = [Int.max, 3]
        let expected: Int = Int.max/3
        asyncHelper(input: input, expected: expected)
    }
    func test_012() {
        let input: [Int] = [Int.max, Int.min]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_013() {
        let input: [Int] = [Int.min, Int.max]
        let expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_014() {
        let input: [Int] = [Int.min, Int.min]
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_015() {
        let input: [Int] = [Int.max, Int.max]
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_016() {
        let input: [Int] = [Int.max - 3, Int.max - 2]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_017() {
        let input: [Int] = [Int.max - 2, Int.max - 3]
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_018() {
        let input: [Int] = [Int.min + 2, Int.min + 3]
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_019() {
        let input: [Int] = [Int.min + 3, Int.min + 2]
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_020() {
        let input: [Int] = [Int.min + 3, 99]
        let expected: Int = (Int.min + 3) / 99
        asyncHelper(input: input, expected: expected)
    }
    func test_021() {
        let input: [Int] = [Int.max - 3, 99]
        let expected: Int = (Int.max - 3) / 99
        asyncHelper(input: input, expected: expected)
    }
    func test_022() {
        let input: [Int] = [9876, 54]
        let expected: Int = 9876 / 54
        asyncHelper(input: input, expected: expected)
    }
    func test_023() {
        let input: [Int] = [9876, -54]
        let expected: Int = 9876 / -54
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input ipt: [Int], expected: Int) {
        var input = ipt
        weak var expectation: XCTestExpectation? = self.expectation(withDescription: Medium_029_Divide_Two_Integers_Test.TimeOutName)
        DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault).async(execute: { () -> Void in
            let result: Int = Medium_029_Divide_Two_Integers.divide(dividend: input[0], divisor: input[1])
            assertHelper(expected == result, problemName: Medium_029_Divide_Two_Integers_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(withTimeout: Medium_029_Divide_Two_Integers_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_029_Divide_Two_Integers_Test.ProblemName, input: input, resultValue: Medium_029_Divide_Two_Integers_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
