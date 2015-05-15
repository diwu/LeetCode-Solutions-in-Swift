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
        var input: [Int] = [3, 1]
        var expected: Int = 3
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        var input: [Int] = [-1, 1]
        var expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        var input: [Int] = [11, 3]
        var expected: Int = 3
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        var input: [Int] = [999, 0]
        var expected: Int = Int.max
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        var input: [Int] = [-999, 0]
        var expected: Int = Int.max
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        var input: [Int] = [Int.min, -1]
        var expected: Int = Int.max
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        var input: [Int] = [Int.max, -1]
        var expected: Int = 0 - Int.max
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        var input: [Int] = [Int.max, -2]
        var expected: Int = Int.max / (-2)
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        var input: [Int] = [Int.min, -999]
        var expected: Int = Int.min / (-999)
        asyncHelper(input: input, expected: expected)
    }
    func test_010() {
        var input: [Int] = [Int.max, 1]
        var expected: Int = Int.max
        asyncHelper(input: input, expected: expected)
    }
    func test_011() {
        var input: [Int] = [Int.max, 3]
        var expected: Int = Int.max/3
        asyncHelper(input: input, expected: expected)
    }
    func test_012() {
        var input: [Int] = [Int.max, Int.min]
        var expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_013() {
        var input: [Int] = [Int.min, Int.max]
        var expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_014() {
        var input: [Int] = [Int.min, Int.min]
        var expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_015() {
        var input: [Int] = [Int.max, Int.max]
        var expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_016() {
        var input: [Int] = [Int.max - 3, Int.max - 2]
        var expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_017() {
        var input: [Int] = [Int.max - 2, Int.max - 3]
        var expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_018() {
        var input: [Int] = [Int.min + 2, Int.min + 3]
        var expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_019() {
        var input: [Int] = [Int.min + 3, Int.min + 2]
        var expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_020() {
        var input: [Int] = [Int.min + 3, 99]
        var expected: Int = (Int.min + 3) / 99
        asyncHelper(input: input, expected: expected)
    }
    func test_021() {
        var input: [Int] = [Int.max - 3, 99]
        var expected: Int = (Int.max - 3) / 99
        asyncHelper(input: input, expected: expected)
    }
    func test_022() {
        var input: [Int] = [9876, 54]
        var expected: Int = 9876 / 54
        asyncHelper(input: input, expected: expected)
    }
    func test_023() {
        var input: [Int] = [9876, -54]
        var expected: Int = 9876 / -54
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(var # input: [Int], expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Medium_029_Divide_Two_Integers_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result: Int = Medium_029_Divide_Two_Integers.divide(dividend: input[0], divisor: input[1])
            assertHelper(expected == result, problemName: Medium_029_Divide_Two_Integers_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Medium_029_Divide_Two_Integers_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_029_Divide_Two_Integers_Test.ProblemName, input: input, resultValue: Medium_029_Divide_Two_Integers_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
