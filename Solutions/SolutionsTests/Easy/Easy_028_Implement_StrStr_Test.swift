//
//  Easy_028_Implement_StrStr_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/9/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_028_Implement_StrStr_Test: XCTestCase {
    private static let ProblemName: String = "Easy_028_Implement_StrStr"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        var input: [Any?] = ["abc", "a"]
        var expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        var input: [Any?] = [nil, nil]
        var expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        var input: [Any?] = ["a", nil]
        var expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        var input: [Any?] = [nil, "a"]
        var expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        var input: [Any?] = ["abc", "d"]
        var expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        var input: [Any?] = ["abc", "b"]
        var expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        var input: [Any?] = ["abcdebcdebcdebc", "de"]
        var expected: Int = 3
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        var input: [Any?] = ["bcd", "bcde"]
        var expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        var input: [Any?] = ["bcd", "abcd"]
        var expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    func test_010() {
        var input: [Any?] = ["", ""]
        var expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_011() {
        var input: [Any?] = ["a", ""]
        var expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_012() {
        var input: [Any?] = ["", "a"]
        var expected: Int = -1
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(var # input: [Any?], expected: Int) {
        var expectation: XCTestExpectation = self.expectationWithDescription(Easy_028_Implement_StrStr_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result_brute_force: Int = Easy_028_Implement_StrStr.strStr_brute_force(hayStack: input[0] as! String?, needle: input[1] as! String?)
            var result_KMP: Int = Easy_028_Implement_StrStr.strStr_KMP(hayStack: input[0] as! String?, needle: input[1] as! String?)
            assertHelper(expected == result_brute_force && result_brute_force == result_KMP, problemName: Easy_028_Implement_StrStr_Test.ProblemName, input: input, resultValue: ["brute force: \(result_brute_force)", "KMP: \(result_KMP)"], expectedValue: expected)
            expectation.fulfill()
        })
        waitForExpectationsWithTimeout(Easy_028_Implement_StrStr_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Easy_028_Implement_StrStr_Test.ProblemName, input: input, resultValue: Easy_028_Implement_StrStr_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
