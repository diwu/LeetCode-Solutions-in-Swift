//
//  Medium_078_Subsets_Test.swift
//  Solutions
//
//  Created by Di Wu on 8/13/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_078_Subsets_Test: XCTestCase {
    private static let ProblemName: String = "Medium_078_Subsets"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        var input: [Int] = [1, 2, 3]
        let expected: [[Int]] = [
            [3],
            [1],
            [2],
            [1,2,3],
            [1,3],
            [2,3],
            [1,2],
            []
        ]
        asyncHelper(input: &input, expected: expected)
    }
    func test_002() {
        var input: [Int] = []
        let expected: [[Int]] = [
            []
        ]
        asyncHelper(input: &input, expected: expected)
    }
    func test_003() {
        var input: [Int] = [1]
        let expected: [[Int]] = [
            [],
            [1]
        ]
        asyncHelper(input: &input, expected: expected)
    }
    func test_004() {
        var input: [Int] = [1, 2]
        let expected: [[Int]] = [
            [],
            [1],
            [2],
            [1,2]
        ]
        asyncHelper(input: &input, expected: expected)
    }
    private func asyncHelper(inout input input: [Int], expected: [[Int]]) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Medium_078_Subsets_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            let result = Medium_078_Subsets.subsets(input)
            let resultSet: NSSet = NSSet(array: result)
            let expectedSet: NSSet = NSSet(array: expected)
            assertHelper(resultSet == expectedSet, problemName: Medium_078_Subsets_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Medium_078_Subsets_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_078_Subsets_Test.ProblemName, input: input, resultValue: Medium_078_Subsets_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
