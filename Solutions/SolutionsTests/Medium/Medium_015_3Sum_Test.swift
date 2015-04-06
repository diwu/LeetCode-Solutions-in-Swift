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
        var input: [Int] = []
        var result: [[Int]] = Medium_015_3Sum.threeSum(input)
        var expected: [[Int]] = []
        assertHelper(result == expected, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
    }

    func test_002() {
        var input: [Int] = [-1, 0, 1, 2, -1, -4]
        var result: [[Int]] = Medium_015_3Sum.threeSum(input)
        var expected: [[Int]] = [[-1, 0, 1], [-1, -1, 2]]

        if count(result) != count(expected) {
            assertHelper(false, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
        } else {
            for var i = 0; i < count(expected); i++ {
                var flag: Bool = false
                for var j = 0; j < count(result); j++ {
                    if result[j][0] == expected[i][0] && result[j][1] == expected[i][1] && result[j][2] == expected[i][2] {
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
        var input: [Int] = [-1, -2, -3]
        var result: [[Int]] = Medium_015_3Sum.threeSum(input)
        var expected: [[Int]] = []
        assertHelper(result == expected, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
    }

    func test_004() {
        var input: [Int] = [-9, 8, 2, 0, 1, -3, 10, -9, 8, -10]
        var result: [[Int]] = Medium_015_3Sum.threeSum(input)
        var expected: [[Int]] = [[-10, 0, 10], [-9, 1, 8], [-3, 1, 2], [-10, 2, 8]]

        if count(result) != count(expected) {
            assertHelper(false, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
        } else {
            for var i = 0; i < count(expected); i++ {
                var flag: Bool = false
                for var j = 0; j < count(result); j++ {
                    if result[j][0] == expected[i][0] && result[j][1] == expected[i][1] && result[j][2] == expected[i][2] {
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

