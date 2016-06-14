//
//  Medium_091_Decode_Ways_Test.swift
//  Solutions
//
//  Created by Di Wu on 10/23/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_091_Decode_Ways_Test: XCTestCase {
    private static let ProblemName: String = "Medium_091_Decode_Ways"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: String = "12"
        let expected: Int = 2
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: String = "125"
        let expected: Int = 3
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: String = "127"
        let expected: Int = 2
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: String = "262"
        let expected: Int = 2
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: String = "212"
        let expected: Int = 3
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: String, expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectation(withDescription: Medium_091_Decode_Ways_Test.TimeOutName)
        DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault).async(execute: { () -> Void in
            let result = Medium_091_Decode_Ways.numDecodings(input)
            assertHelper(result == expected, problemName: Medium_091_Decode_Ways_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(withTimeout: Medium_091_Decode_Ways_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_091_Decode_Ways_Test.ProblemName, input: input, resultValue: Medium_091_Decode_Ways_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
