//
//  Hard_051_N_Queens_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/23/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Hard_051_N_Queens_Test: XCTestCase {
    private static let ProblemName: String = "Hard_051_N_Queens"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        var input: Int = 4
        var expected: [[String]] = [
            [
                ".Q..",
                "...Q",
                "Q...",
                "..Q."
            ],[
                "..Q.",
                "Q...",
                "...Q",
                ".Q.."
            ]
        ]
        var result = Hard_051_N_Queens.solveNQueens(input)
        if count(result) != count(expected) {
            assertHelper(false, problemName: Hard_051_N_Queens_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
        } else {
            for var i = 0; i < count(expected); i++ {
                var flag = false
                for var j = 0; j < count(result); j++ {
                    if result[j] == expected[i] {
                        flag = true
                    }
                }
                if flag == false {
                    assertHelper(false, problemName: Hard_051_N_Queens_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
                }
            }
        }
    }
}
