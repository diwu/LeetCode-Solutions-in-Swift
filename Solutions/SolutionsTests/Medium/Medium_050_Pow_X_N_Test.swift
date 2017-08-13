//
//  Medium_050_Pow_X_N_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/23/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_050_Pow_X_N_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Medium_050_Pow_X_N"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [Any] = [987.654, 4]
        let expected: Double = pow(987.654, 4)
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Any] = [987.654, 0]
        let expected: Double = pow(987.654, 0)
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Any] = [-987.654, 3]
        let expected: Double = pow(-987.654, 3)
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [Any], expected: Double) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result = Medium_050_Pow_X_N.myPow(x: input[0] as! Double, n: input[1] as! Int)
            assertHelper(abs(expected - result) < 0.001, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
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
