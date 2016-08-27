//
//  Hard_068_Text_Justification_Test.swift
//  Solutions
//
//  Created by Di Wu on 7/18/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Hard_068_Text_Justification_Test: XCTestCase {
    private static let ProblemName: String = "Hard_068_Text_Justification"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [Any] = [
            [
                "This",
                "is", "an",
                "example",
                "of",
                "text",
                "justification."
            ],
            16
        ]
        let expected: [String] = [
            "This    is    an",
            "example  of text",
            "justification.  "
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Any] = [
            [
                "What",
                "must",
                "be",
                "shall",
                "be."],
            12
        ]
        let expected: [String] = [
            "What must be",
            "shall be.   "
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Any] = [
            [
                ""
            ],
            2
        ]
        let expected: [String] = [
            "  "
        ]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [Any], expected: [String]) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Hard_068_Text_Justification_Test.TimeOutName)
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async(execute: { () -> Void in
            let result = Hard_068_Text_Justification.fullJustify(input[0] as! [String], maxWidth: input[1] as! Int)
            assertHelper(result == expected, problemName: Hard_068_Text_Justification_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Hard_068_Text_Justification_Test.TimeOut) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Hard_068_Text_Justification_Test.ProblemName, input: input, resultValue: Hard_068_Text_Justification_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
