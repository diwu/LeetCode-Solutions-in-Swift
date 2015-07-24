//
//  Medium_069_Sqrt_X_Test.swift
//  Solutions
//
//  Created by Di Wu on 7/23/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_069_Sqrt_X_Test: XCTestCase {
    private static let ProblemName: String = "Medium_069_Sqrt_X"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value * 10
    func test_001() {
        let input: Int = 9
        let expected: Int = 3
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: Int = 0
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: Int = 5
        let expected: Int = 2
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: Int = Int(sqrt(Double(Int.max)))
        let expected: Int = Int(sqrt(sqrt(Double(Int.max))))
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input input: Int, expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Medium_069_Sqrt_X_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            let result = Medium_069_Sqrt_X.mySqrt(input)
            assertHelper(result == expected, problemName: Medium_069_Sqrt_X_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Medium_069_Sqrt_X_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_069_Sqrt_X_Test.ProblemName, input: input, resultValue: Medium_069_Sqrt_X_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
