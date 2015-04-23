//
//  Medium_016_3Sum_Closest_Test.swift
//  Solutions
//
//  Created by Di Wu on 4/16/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_016_3Sum_Closest_Test: XCTestCase {

    let ProblemName: String = "Medium_016_3Sum_Closest"
    
    func test_001() {
        var input: [Int] = []
        var result: Int = Medium_016_3Sum_Closest.threeSumClosest(num: input, target: 999)
        var expected: Int = 0
        assertHelper(result == expected, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_002() {
        var input: [Int] = [1]
        var result: Int = Medium_016_3Sum_Closest.threeSumClosest(num: input, target: 999)
        var expected: Int = 1
        assertHelper(result == expected, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_003() {
        var input: [Int] = [1, 2, 3]
        var result: Int = Medium_016_3Sum_Closest.threeSumClosest(num: input, target: 999)
        var expected: Int = 6
        assertHelper(result == expected, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_004() {
        var input: [Int] = [1, 1, 1, 999]
        var result: Int = Medium_016_3Sum_Closest.threeSumClosest(num: input, target: 999)
        var expected: Int = 1001
        assertHelper(result == expected, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_005() {
        var input: [Int] = [-1, 2, 1, -4]
        var result: Int = Medium_016_3Sum_Closest.threeSumClosest(num: input, target: 1)
        var expected: Int = 2
        assertHelper(result == expected, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_006() {
        var input: [Int] = [-1, 2, 1, -4, 6]
        var result: Int = Medium_016_3Sum_Closest.threeSumClosest(num: input, target: 1)
        var expected: Int = 1
        assertHelper(result == expected, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
    }
}
