//
//  Medium_016_3Sum_Closest_Test.swift
//  Solutions
//
//  Created by Di Wu on 4/16/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_016_3Sum_Closest_Test: XCTestCase, SolutionsTestCase {

    let ProblemName: String = "Medium_016_3Sum_Closest"
    
    func test_001() {
        let input: [Int] = []
        let result: Int = Medium_016_3Sum_Closest.threeSumClosest(num: input, target: 999)
        let expected: Int = 0
        assertHelper(result == expected, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_002() {
        let input: [Int] = [1]
        let result: Int = Medium_016_3Sum_Closest.threeSumClosest(num: input, target: 999)
        let expected: Int = 1
        assertHelper(result == expected, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_003() {
        let input: [Int] = [1, 2, 3]
        let result: Int = Medium_016_3Sum_Closest.threeSumClosest(num: input, target: 999)
        let expected: Int = 6
        assertHelper(result == expected, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_004() {
        let input: [Int] = [1, 1, 1, 999]
        let result: Int = Medium_016_3Sum_Closest.threeSumClosest(num: input, target: 999)
        let expected: Int = 1001
        assertHelper(result == expected, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_005() {
        let input: [Int] = [-1, 2, 1, -4]
        let result: Int = Medium_016_3Sum_Closest.threeSumClosest(num: input, target: 1)
        let expected: Int = 2
        assertHelper(result == expected, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_006() {
        let input: [Int] = [-1, 2, 1, -4, 6]
        let result: Int = Medium_016_3Sum_Closest.threeSumClosest(num: input, target: 1)
        let expected: Int = 1
        assertHelper(result == expected, problemName: ProblemName, input: input, resultValue: result, expectedValue: expected)
    }
}
