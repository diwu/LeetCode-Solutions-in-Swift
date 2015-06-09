//
//  Hard_004_Median_Of_Two_Sorted_Arrays_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/27/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Hard_004_Median_Of_Two_Sorted_Arrays_Test: XCTestCase {
    func testCase001() {
        let v = Hard_004_Median_Of_Two_Sorted_Arrays.median2([1, 2, 10], b: [30, 40, 50])
        XCTAssert(v == 20, "Hard_004_Median_Of_Two_Sorted_Arrays_Test #1")
    }

    func testCase002() {
        let v = Hard_004_Median_Of_Two_Sorted_Arrays.median2([1], b: [1])
        XCTAssert(v == 1, "Hard_004_Median_Of_Two_Sorted_Arrays_Test #2")
    }

    func testCase003() {
        let v = Hard_004_Median_Of_Two_Sorted_Arrays.median2([1, 2], b: [1])
        XCTAssert(v == 1, "Hard_004_Median_Of_Two_Sorted_Arrays_Test #3")
    }

    func testCase004() {
        let v = Hard_004_Median_Of_Two_Sorted_Arrays.median2([1], b: [10, 20, 30])
        XCTAssert(v == 15, "Hard_004_Median_Of_Two_Sorted_Arrays_Test #4")
    }

    func testCase005() {
        let v = Hard_004_Median_Of_Two_Sorted_Arrays.median2([1], b: [10, 20, 30, 40])
        XCTAssert(v == 20, "Hard_004_Median_Of_Two_Sorted_Arrays_Test #5")
    }

    func testCase006() {
        let v = Hard_004_Median_Of_Two_Sorted_Arrays.median2([10, 20, 30], b: [10, 20, 30])
        XCTAssert(v == 20, "Hard_004_Median_Of_Two_Sorted_Arrays_Test #6")
    }

    func testCase007() {
        let v = Hard_004_Median_Of_Two_Sorted_Arrays.median2([], b: [10, 20, 30])
        XCTAssert(v == 20, "Hard_004_Median_Of_Two_Sorted_Arrays_Test #7")
    }
}

/*
// test cases
median2([1, 2, 10], [30, 40, 50])   //20
median2([1], [1])   //1
median2([1, 2], [1])   //1
median2([1], [10, 20, 30])   //15
median2([1], [10, 20, 30, 40])   //20
median2([10, 20, 30], [10, 20, 30])   //20
median2([], [10, 20, 30])   //20
*/