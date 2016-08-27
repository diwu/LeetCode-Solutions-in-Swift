//
//  Medium_015_3Sum_Test.swift
//  Solutions
//
//  Created by Di Wu on 4/6/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_015_3Sum_Test: XCTestCase {

    let ProblemName: String = "Medium_015_3Sum"

    func test_001() {
        let input: [Int] = []
        let result: [[Int]] = Medium_015_3Sum.threeSum(input)
        let expected: [[Int]] = []
        assertHelper(compareTwoDimensionIntArray(arr0: result, arr1: expected), problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
    }

    func test_002() {
        let input: [Int] = [-1, 0, 1, 2, -1, -4]
        var result: [[Int]] = Medium_015_3Sum.threeSum(input)
        var expected: [[Int]] = [[-1, 0, 1], [-1, -1, 2]]

        if result.count != expected.count {
            assertHelper(false, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
        } else {
            for i in 0 ..< expected.count {
                var flag: Bool = false
                for j in 0 ..< result.count {
                    let b0 = result[j][0] == expected[i][0]
                    let b1 = result[j][1] == expected[i][1]
                    let b2 = result[j][2] == expected[i][2]
                    if b0 && b1 && b2 {
                        flag = true
                        break
                    }
                }
                if flag == false {
                    assertHelper(false, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
                }
            }
        }
    }

    func test_003() {
        let input: [Int] = [-1, -2, -3]
        let result: [[Int]] = Medium_015_3Sum.threeSum(input)
        let expected: [[Int]] = []
        assertHelper(compareTwoDimensionIntArray(arr0: result, arr1: expected), problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
    }

    func test_004() {
        let input: [Int] = [-9, 8, 2, 0, 1, -3, 10, -9, 8, -10]
        var result: [[Int]] = Medium_015_3Sum.threeSum(input)
        var expected: [[Int]] = [[-10, 0, 10], [-9, 1, 8], [-3, 1, 2], [-10, 2, 8]]

        if result.count != expected.count {
            assertHelper(false, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
        } else {
            for i in 0 ..< expected.count {
                var flag: Bool = false
                for j in 0 ..< result.count {
                    let b0 = result[j][0] == expected[i][0]
                    let b1 = result[j][1] == expected[i][1]
                    let b2 = result[j][2] == expected[i][2]
                    if b0 && b1 && b2 {
                        flag = true
                        break
                    }
                }
                if flag == false {
                    assertHelper(false, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
                }
            }
        }
    }
}

