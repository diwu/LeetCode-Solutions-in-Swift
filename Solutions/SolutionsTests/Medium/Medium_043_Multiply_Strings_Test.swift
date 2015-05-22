//
//  Medium_043_Multiply_Strings_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/22/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_043_Multiply_Strings_Test: XCTestCase {
    private static let ProblemName: String = "Medium_043_Multiply_Strings"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value * 10
    func test_001() {
        var input: [String] = ["123", "9876"]
        var expected: String = "1214748"
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        var input: [String] = ["123", "00000"]
        var expected: String = "0"
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        var input: [String] = ["9046720578679481304827107845738", "7307858291070163424907"]
        var expected: String = "66112151987897914185037067763780539471710428702996366"
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(# input: [String], expected: String) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Medium_043_Multiply_Strings_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result: String = Medium_043_Multiply_Strings.multiply(num1: input[0], num2: input[1])
            assertHelper(expected == result, problemName: Medium_043_Multiply_Strings_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Medium_043_Multiply_Strings_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_043_Multiply_Strings_Test.ProblemName, input: input, resultValue: Medium_043_Multiply_Strings_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
