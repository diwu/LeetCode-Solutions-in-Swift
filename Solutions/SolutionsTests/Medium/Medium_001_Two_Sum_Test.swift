//
//  Medium_001_Two_Sum_Test.swift
//  Solutions
//
//  Created by Di Wu on 3/6/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_001_Two_Sum_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Medium_001_Two_Sum"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input0: [Int] = [2, 7, 11, 15]
        let input1: Int = 9
        let expected: [Int] = [1, 2]
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_002() {
        let input0: [Int] = [5, 5]
        let input1: Int = 10
        let expected: [Int] = [1, 2]
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_003() {
        let input0: [Int] = [5, 7, 5, 2, 11, 15]
        let input1: Int = 9
        let expected: [Int] = [2, 4]
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    private func asyncHelper(input0: [Int], input1: Int, expected: [Int]) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result_swift: [Int] = Medium_001_Two_Sum.twoSum(numbers: input0, target: input1)
            let result_objc: [NSNumber] = ObjC_Medium_001_Two_Sum.twoSum(input0 as [NSNumber], target: input1)
            assertHelper(expected == result_swift, problemName:self.problemName(), input: input0, resultValue: result_swift, expectedValue: expected)
            var result_objc_Int = [Int]()
            for n in result_objc {
                result_objc_Int.append(n.intValue)
            }
            assertHelper(result_objc_Int == expected, problemName:self.problemName(), input: input0, resultValue: result_objc, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout:timeOut()) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input0, resultValue: Medium_001_Two_Sum_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}

/*
twoSum([2, 7, 11, 15], 9)   //[1, 2]
twoSum([5, 5], 10)          //[1, 2]
*/
