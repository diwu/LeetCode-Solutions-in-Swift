//
//  Easy_036_Valid_Sudoku_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/13/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_036_Valid_Sudoku_Test: XCTestCase {
    private static let ProblemName: String = "Easy_036_Valid_Sudoku"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        var input: [[Character]] = [
            ["5", "3", ".", ".", "7", ".", ".", ".", "."],
            ["6", ".", ".", "1", "9", "5", ".", ".", "."],
            [".", "9", "8", ".", ".", ".", ".", "6", "."],

            ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
            ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
            ["7", ".", ".", ".", "2", ".", ".", ".", "6"],

            [".", "6", ".", ".", ".", ".", "2", "8", "."],
            [".", ".", ".", "4", "1", "9", ".", ".", "5"],
            [".", ".", ".", ".", "8", ".", ".", "7", "9"],
        ]
        var expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        var input: [[Character]] = [
            ["5", "3", ".", ".", "7", ".", ".", ".", "."],
            ["6", ".", ".", "1", "9", "5", ".", ".", "."],
            [".", "9", "8", ".", ".", ".", ".", "6", "."],

            ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
            ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
            ["7", ".", ".", ".", "2", ".", ".", ".", "6"],

            [".", "6", ".", ".", ".", ".", "2", "8", "."],
            [".", ".", ".", "4", "1", "9", ".", ".", "5"],
            ["5", ".", ".", ".", "8", ".", ".", "7", "9"],
        ]
        var expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        var input: [[Character]] = [
            ["5", "3", ".", ".", "7", ".", ".", ".", "."],
            ["6", ".", ".", "1", "9", "5", ".", ".", "."],
            [".", "9", "8", ".", ".", ".", ".", "6", "."],

            ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
            ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
            ["7", ".", ".", ".", "2", ".", ".", ".", "6"],

            [".", "6", ".", ".", ".", ".", "2", "8", "."],
            [".", "1", ".", "4", "1", "9", ".", ".", "5"],
            [".", ".", ".", ".", "8", ".", ".", "7", "9"],
        ]
        var expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        var input: [[Character]] = [
            ["5", "3", ".", ".", "7", ".", ".", ".", "."],
            ["6", ".", ".", "1", "9", "5", ".", ".", "."],
            [".", "9", "8", ".", ".", ".", ".", "6", "."],

            ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
            ["4", ".", ".", "8", ".", "3", "6", ".", "1"],
            ["7", ".", ".", ".", "2", ".", ".", ".", "6"],

            [".", "6", ".", ".", ".", ".", "2", "8", "."],
            [".", ".", ".", "4", "1", "9", ".", ".", "5"],
            [".", ".", ".", ".", "8", ".", ".", "7", "9"],
        ]
        var expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        var input: [[Character]] = [
            ["5", "3", ".", ".", "7", ".", ".", ".", "."],
            ["6", ".", ".", "1", "9", "5", ".", ".", "."],
            [".", "9", "8", ".", ".", ".", ".", "6", "."],

            ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
            ["4", ".", ".", "8", ".", "3", "5", ".", "1"],
            ["7", ".", ".", ".", "2", ".", ".", ".", "6"],

            [".", "6", ".", ".", ".", ".", "2", "8", "."],
            [".", ".", ".", "4", "1", "9", ".", ".", "5"],
            [".", ".", ".", ".", "8", ".", ".", "7", "9"],
        ]
        var expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(var # input: [[Character]], expected: Bool) {
        var expectation: XCTestExpectation = self.expectationWithDescription(Easy_036_Valid_Sudoku_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result: Bool = Easy_036_Valid_Sudoku.isValidSudoku(input)
            assertHelper(expected == result, problemName: Easy_036_Valid_Sudoku_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            expectation.fulfill()
        })
        waitForExpectationsWithTimeout(Easy_036_Valid_Sudoku_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Easy_036_Valid_Sudoku_Test.ProblemName, input: input, resultValue: Easy_036_Valid_Sudoku_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
