//
//  Medium_049_Anagrams_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/23/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_049_Anagrams_Test: XCTestCase, SolutionsTestCase {
    func test_001() {
        let input: [String] = ["cat", "rye", "aye", "dog", "god", "cud", "cat", "old", "fop", "bra", "aaab", "abaa"]
        let expected: [[String]] = [
            ["cat", "cat"],
            ["dog", "god"],
            ["aaab", "abaa"],
            ["rye"],
            ["aye"],
            ["cud"],
            ["old"], 
            ["fop"], 
            ["bra"]
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [String] = ["dog","cat","god","tac"]
        let expected: [[String]] = [
            ["cat", "tac"],
            ["dog", "god"]
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [String] = []
        let expected: [[String]] = []
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [String] = ["eat", "tea", "tan", "ate", "nat", "bat"]
        let expected: [[String]] =  [
            ["ate", "eat","tea"],
            ["nat","tan"],
            ["bat"]
        ]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [String], expected: [[String]]) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result = Medium_049_Anagrams.anagrams(input)
            if result.count != expected.count {
                assertHelper(false, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
            } else {
                for i in 0 ..< expected.count {
                    var flag = false
                    for j in 0 ..< result.count {
                        let arr0 = result[j].sorted()
                        let arr1 = expected[i].sorted()
                        if arr0 == arr1 {
                            flag = true
                        }
                    }
                    if flag == false {
                        assertHelper(false, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
                    }
                }
            }
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
