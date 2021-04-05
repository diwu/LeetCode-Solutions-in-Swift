//
//  Medium_099_Number_Of_Islands_Test.swift
//  Medium_099_Number_Of_IslandsTests
//
//  Copyright © 2020 Jayant Sogiakar. All rights reserved.
//

import Foundation
import XCTest
@testable import Medium_099_Number_Of_Islands
class Medium_099_Number_Of_Islands_Test: XCTestCase {
    func test_001(){
        let val = numIslands([
          ["1","1","1","1","0"],
          ["1","1","0","1","0"],
          ["1","1","0","0","0"],
          ["0","0","0","0","0"]
        ])
        XCTAssertEqual(val, 1)
    }
    func test_002(){
        let val = numIslands([
          ["1","1","0","0","0"],
          ["1","1","0","0","0"],
          ["0","0","1","0","0"],
          ["0","0","0","1","1"]
        ])
        XCTAssertEqual(val, 3)
    }
    func test_3(){
        let val = numIslands( [["1","0","1","1","0","1","1"]])
        XCTAssertEqual(val, 3)
    }
}
