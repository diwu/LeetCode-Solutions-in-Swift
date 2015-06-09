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
        let input: Int = 4
        let expected: [[String]] = [
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
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input  input: Int, expected: [[String]]) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Hard_051_N_Queens_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result = Hard_051_N_Queens.solveNQueens(input)
            if result.count != expected.count {
                assertHelper(false, problemName: Hard_051_N_Queens_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            } else {
                for var i = 0; i < expected.count; i++ {
                    var flag = false
                    for var j = 0; j < result.count; j++ {
                        if result[j] == expected[i] {
                            flag = true
                        }
                    }
                    if flag == false {
                        assertHelper(false, problemName: Hard_051_N_Queens_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
                    }
                }
            }
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Hard_051_N_Queens_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Hard_051_N_Queens_Test.ProblemName, input: input, resultValue: Hard_051_N_Queens_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
