//
//  Medium_060_Permutation_Sequence_Test.swift
//  Solutions
//
//  Created by Di Wu on 6/17/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_060_Permutation_Sequence_Test: XCTestCase {
    private static let ProblemName: String = "Medium_060_Permutation_Sequence"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [Int] = [3, 1]
        let expected: String = "123"
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Int] = [4, 24]
        let expected: String = "4321"
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Int] = [4, 23]
        let expected: String = "4312"
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input  input: [Int], expected: String) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Medium_060_Permutation_Sequence_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            let result = Medium_060_Permutation_Sequence.getPermutation(n: input[0], k: input[1])
            assertHelper(result == expected, problemName: Medium_060_Permutation_Sequence_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Medium_060_Permutation_Sequence_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_060_Permutation_Sequence_Test.ProblemName, input: input, resultValue: Medium_060_Permutation_Sequence_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
