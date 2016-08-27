//
//  Medium_077_Combinations_Test.swift
//  Solutions
//
//  Created by Di Wu on 8/6/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_077_Combinations_Test: XCTestCase {
    private static let ProblemName: String = "Medium_077_Combinations"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value * 10
    func test_001() {
        let input: [Int] = [4, 2]
        let expected: [[Int]] = [
            [2,4],
            [3,4],
            [2,3],
            [1,2],
            [1,3],
            [1,4],
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Int] = [1, 1]
        let expected: [[Int]] = [
            [1]
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Int] = [2, 1]
        let expected: [[Int]] = [
            [1],
            [2]
        ]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [Int], expected: [[Int]]) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Medium_077_Combinations_Test.TimeOutName)
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async(execute: { () -> Void in
            let result = Medium_077_Combinations.combine(n: input[0], k: input[1])
            let result2 = Medium_077_Combinations.combine_recursion(n: input[0], k: input[1])
            let resultSet: NSSet = NSSet(array: result)
            let resultSet2: NSSet = NSSet(array: result2)
            let expectedSet: NSSet = NSSet(array: expected)
            assertHelper(resultSet == expectedSet && resultSet2 == expectedSet, problemName: Medium_077_Combinations_Test.ProblemName, input: input, resultValue: result2, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Medium_077_Combinations_Test.TimeOut) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_077_Combinations_Test.ProblemName, input: input, resultValue: Medium_077_Combinations_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
