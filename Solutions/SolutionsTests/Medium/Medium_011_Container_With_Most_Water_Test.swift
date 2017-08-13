//
//  Medium_011_Container_With_Most_Water.swift
//  Solutions
//
//  Created by test on 3/29/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_011_Container_With_Most_Water_Test: XCTestCase, SolutionsTestCase {

    let ProbleName: String = "Medium_011_Container_With_Most_Water"

    func test_001() {
        let input: [Int] = [1, 1]
        let expected: Int = 1
        let result = Medium_011_Container_With_Most_Water.maxArea(heightsArray: input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_002() {
        let input: [Int] = [1, 2]
        let expected: Int = 1
        let result = Medium_011_Container_With_Most_Water.maxArea(heightsArray: input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_003() {
        let input: [Int] = [1, 2, 1]
        let expected: Int = 2
        let result = Medium_011_Container_With_Most_Water.maxArea(heightsArray: input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_004() {
        let input: [Int] = [2, 1, 2]
        let expected: Int = 4
        let result = Medium_011_Container_With_Most_Water.maxArea(heightsArray: input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
    func test_005() {
        let input: [Int] = [2, 2, 1, 1]
        let expected: Int = 3
        let result = Medium_011_Container_With_Most_Water.maxArea(heightsArray: input)
        assertHelper(result == expected, problemName: ProbleName, input: input, resultValue: result, expectedValue: expected)
    }
}

/*
    [1, 1]          => 1
    [1, 2]          => 1
    [1, 2, 1]       => 2
    [2, 1, 2]       => 4
    [2, 2, 1, 1]    => 3
*/


