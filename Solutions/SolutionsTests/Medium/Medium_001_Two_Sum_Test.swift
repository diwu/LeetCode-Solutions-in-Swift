//
//  Medium_001_Two_Sum_Test.swift
//  Solutions
//
//  Created by Di Wu on 3/6/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_001_Two_Sum_Test: XCTestCase {
    func testCase001() {
        var arr1: [Int] = Medium_001_Two_Sum.twoSum([2, 7, 11, 15], target: 9)
        var arr2: [Int] = [1, 2]
        XCTAssert(arr1 == arr2, "Medium_001_Two_Sum_Test #1")
    }
    func testCase002() {
        var arr1: [Int] = Medium_001_Two_Sum.twoSum([5, 5], target: 10)
        var arr2: [Int] = [1, 2]
        XCTAssert(arr1 == arr2, "Medium_001_Two_Sum_Test #2")
    }
}

/*
twoSum([2, 7, 11, 15], 9)   //[1, 2]
twoSum([5, 5], 10)          //[1, 2]
*/