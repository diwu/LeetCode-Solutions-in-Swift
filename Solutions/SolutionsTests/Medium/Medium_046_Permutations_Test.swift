//
//  Medium_046_Permutations_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/23/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_046_Permutations_Test: XCTestCase {
    private static let ProblemName: String = "Medium_046_Permutations"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value * 10
    func test_001() {
        let input: [Int] = [1, 2, 3]
        let expected: [[Int]] = [[1, 2, 3], [2, 1, 3], [1, 3, 2], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Int] = [1, 2, 3, 4]
        let expected: [[Int]] = [[4, 3, 2, 1], [1, 2, 3, 4], [1, 2, 4, 3], [1, 3, 2, 4], [1, 3, 4, 2], [2, 1, 3, 4], [2, 1, 4, 3], [2, 3, 1, 4], [2, 3, 4, 1], [3, 1, 2, 4], [3, 1, 4, 2], [3, 2, 1, 4], [3, 2, 4, 1], [3, 4, 1, 2], [3, 4, 2, 1], [1, 4, 2, 3], [1, 4, 3, 2], [2, 4, 1, 3], [2, 4, 3, 1], [4, 1, 2, 3], [4, 1, 3, 2], [4, 2, 1, 3], [4, 2, 3, 1], [4, 3, 1, 2]]
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Int] = [1]
        let expected: [[Int]] = [[1]]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [Int], expected: [[Int]]) {
        weak var expectation: XCTestExpectation? = self.expectation(withDescription: Medium_046_Permutations_Test.TimeOutName)
        DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault).async(execute: { () -> Void in
            var result = Medium_046_Permutations.permute(input)
            if result.count != expected.count {
                assertHelper(false, problemName: Medium_046_Permutations_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            } else {
                for i in 0 ..< expected.count{
                    var flag = false
                    for j in 0 ..< result.count {
                        if expected[i] == result[j] {
                            flag = true
                            break
                        }
                    }
                    if flag == false {
                        assertHelper(false, problemName: Medium_046_Permutations_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
                    }
                }
            }
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(withTimeout: Medium_046_Permutations_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_046_Permutations_Test.ProblemName, input: input, resultValue: Medium_046_Permutations_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
