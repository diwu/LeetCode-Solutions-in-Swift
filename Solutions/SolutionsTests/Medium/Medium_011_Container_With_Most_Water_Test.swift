//
//  Medium_011_Container_With_Most_Water.swift
//  Solutions
//
//  Created by test on 3/29/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_011_Container_With_Most_Water_Test: XCTestCase {
    func test_001() {
        var heightsArray: [Int] = [1, 1]
        var v = Medium_011_Container_With_Most_Water.maxArea(heightsArray: heightsArray)
        XCTAssert(v == 1, "Medium_011_Container_With_Most_Water_Test")
    }
    func test_002() {
        var heightsArray: [Int] = [1, 2]
        var v = Medium_011_Container_With_Most_Water.maxArea(heightsArray: heightsArray)
        XCTAssert(v == 1, "Medium_011_Container_With_Most_Water_Test")
    }
    func test_003() {
        var heightsArray: [Int] = [1, 2, 1]
        var v = Medium_011_Container_With_Most_Water.maxArea(heightsArray: heightsArray)
        XCTAssert(v == 2, "Medium_011_Container_With_Most_Water_Test")
    }
    func test_004() {
        var heightsArray: [Int] = [2, 1, 2]
        var v = Medium_011_Container_With_Most_Water.maxArea(heightsArray: heightsArray)
        XCTAssert(v == 4, "Medium_011_Container_With_Most_Water_Test")
    }
    func test_005() {
        var heightsArray: [Int] = [2, 2, 1, 1]
        var v = Medium_011_Container_With_Most_Water.maxArea(heightsArray: heightsArray)
        XCTAssert(v == 3, "Medium_011_Container_With_Most_Water_Test")
    }
}


