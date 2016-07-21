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
    private func asyncHelper(input: Int, expected: [[String]]) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Hard_051_N_Queens_Test.TimeOutName)
        DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault).async(execute: { () -> Void in
            var result = Hard_051_N_Queens.solveNQueens(input)
            if result.count != expected.count {
                assertHelper(false, problemName: Hard_051_N_Queens_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            } else {
                for i in 0 ..< expected.count {
                    var flag = false
                    for j in 0 ..< result.count {
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
        waitForExpectations(timeout: Hard_051_N_Queens_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Hard_051_N_Queens_Test.ProblemName, input: input, resultValue: Hard_051_N_Queens_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
