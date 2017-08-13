//
//  Medium_003_Longest_Substring_Without_Repeating_Characters_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/27/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_003_Longest_Substring_Without_Repeating_Characters_Test: XCTestCase, SolutionsTestCase {
    func testCase001() {
        let input: String = "abcabcdzaba"
        let expected: Int = 5
        asyncHelper(input: input, expected: expected)
    }

    func testCase002() {
        let input: String = "aaaa"
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }

    func testCase003() {
        let input: String = "aaabbbc"
        let expected: Int = 2
        asyncHelper(input: input, expected: expected)
    }

    func testCase004() {
        let input: String = ""
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: String, expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result_swift: Int = Medium_003_Longest_Substring_Without_Repeating_Characters.longest(input)
            let result_objc: Int = ObjC_Medium_003_Longest_Substring_Without_Repeating_Characters.longest(input)
            assertHelper(expected == result_swift, problemName:self.problemName(), input: input, resultValue: result_swift, expectedValue: expected)
            assertHelper(expected == result_objc, problemName:self.problemName(), input: input, resultValue: result_objc, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout:timeOut()) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input, resultValue:self.timeOutName(), expectedValue: expected)
            }
        }
    }
}

/*
longest("abcabcdzaba")  //5
longest("aaaa")         //1
longest("aaabbbc")      //2
longest("")             //0
*/
