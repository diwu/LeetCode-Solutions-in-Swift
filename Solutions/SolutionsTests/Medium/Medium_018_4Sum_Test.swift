//
//  Medium_018_4Sum_Test.swift
//  Solutions
//
//  Created by Di Wu on 4/19/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_018_4Sum_Test: XCTestCase, SolutionsTestCase {

    static let ProblemName: String = "Medium_018_4Sum"
    static let TimeOutName = ProblemName + Default_Timeout_Suffix
    static let TimeOut = Default_Timeout_Value

    func test_001() {
        let input: [Any] = [[1, 0, -1], 0]
        let expected: [[Int]] = [
        ]
        asyncHelper(input: input, expected: expected)
    }

    func test_002() {
        let input: [Any] = [[1, 0, -1, 0], 0]
        let expected: [[Int]] = [
            [-1, 0, 0, 1]
        ]
        asyncHelper(input: input, expected: expected)
    }

    func test_003() {
        let input: [Any] = [[1, 0, -1, 0, -2, 2], 0]
        let expected: [[Int]] = [
            [-1,  0, 0, 1],
            [-2, -1, 1, 2],
            [-2,  0, 0, 2],
        ]
        asyncHelper(input: input, expected: expected)
    }

    func asyncHelper(input: [Any], expected: [[Int]]) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Medium_018_4Sum_Test.TimeOutName)
        serialQueue().async(execute: { () -> Void in
            var result: [[Int]] = Medium_018_4Sum.fourSum(num: input[0] as! [Int], target: input[1] as! Int)
            if result.count != expected.count {
                assertHelper(false, problemName: Medium_018_4Sum_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            } else {
                for i in 0 ..< expected.count {
                    var flag: Bool = false
                    for j in 0 ..< result.count {
                        let b0 = result[j][0] == expected[i][0]
                        let b1 = result[j][1] == expected[i][1]
                        let b2 = result[j][2] == expected[i][2]
                        let b3 = result[j][3] == expected[i][3]
                        if b0 && b1 && b2 && b3 {
                            flag = true
                            break
                        }
                    }
                    if flag == false {
                        assertHelper(false, problemName: Medium_018_4Sum_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
                    }
                }
            }
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Medium_018_4Sum_Test.TimeOut) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_018_4Sum_Test.ProblemName, input: input, resultValue: Medium_018_4Sum_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
