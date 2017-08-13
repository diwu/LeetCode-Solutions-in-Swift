//
//  Hard_004_Median_Of_Two_Sorted_Arrays_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/27/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Hard_004_Median_Of_Two_Sorted_Arrays_Test: XCTestCase, SolutionsTestCase {
    func test_001() {
        let input0: [Int] = [1, 2, 11]
        let input1: [Int] = [30, 40, 50]
        let expected: Double = 20.5
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }

    func test_002() {
        let input0: [Int] = [1]
        let input1: [Int] = [1]
        let expected: Double = 1
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }

    func test_003() {
        let input0: [Int] = [1, 2]
        let input1: [Int] = [1]
        let expected: Double = 1
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }

    func test_004() {
        let input0: [Int] = [1]
        let input1: [Int] = [10, 20, 30]
        let expected: Double = 15
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }

    func test_005() {
        let input0: [Int] = [1]
        let input1: [Int] = [10, 20, 30, 40]
        let expected: Double = 20
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }

    func test_006() {
        let input0: [Int] = [10, 20, 30]
        let input1: [Int] = [10, 20, 30]
        let expected: Double = 20
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }

    func test_007() {
        let input0: [Int] = []
        let input1: [Int] = [10, 20, 30]
        let expected: Double = 20
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_008() {
        let input0: [Int] = [10, 20, 25, 30]
        let input1: [Int] = [10, 20, 30]
        let expected: Double = 20
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_009() {
        let input0: [Int] = [10, 20, 25, 26, 30]
        let input1: [Int] = [10, 20, 30]
        let expected: Double = 22.5
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_010() {
        let input0: [Int] = [10, 20, 25, 26, 30]
        let input1: [Int] = [10]
        let expected: Double = 22.5
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_011() {
        let input0: [Int] = [10, 20, 25, 26, 30, 40]
        let input1: [Int] = [10]
        let expected: Double = 25
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    private func asyncHelper(input0: [Int], input1: [Int], expected: Double) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result_swift: Double = Hard_004_Median_Of_Two_Sorted_Arrays.findMedianSortedArrays(a: input0, b: input1)

            let result_objc: Double = ObjC_Hard_004_Median_Of_Two_Sorted_Arrays.findMedianSortedArrays(convertIntArrayToNumberArr(intArr: input0), b: convertIntArrayToNumberArr(intArr: input1))
            assertHelper(result_swift == expected, problemName:self.problemName(), input: input0, resultValue: result_swift, expectedValue: expected)
            assertHelper(result_objc == expected, problemName:self.problemName(), input: input0, resultValue: result_objc, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout:timeOut()) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input0, resultValue:self.timeOutName(), expectedValue: expected)
            }
        }
    }
}
