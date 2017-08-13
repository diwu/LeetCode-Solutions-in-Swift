//
//  Medium_049_Anagrams_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/23/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_049_Anagrams_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Medium_049_Anagrams"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [String] = ["cat", "rye", "aye", "dog", "god", "cud", "cat", "old", "fop", "bra"]
        let expected: [String] = ["cat","cat","dog","god"]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [String] = ["dog","cat","god","tac"]
        let expected: [String] = ["dog","cat","god","tac"]
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [String] = []
        let expected: [String] = []
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [String], expected: [String]) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Medium_049_Anagrams_Test.TimeOutName)
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async(execute: { () -> Void in
            let result = Medium_049_Anagrams.anagrams(input)
            assertHelper(Set(result) == Set(expected), problemName: Medium_049_Anagrams_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Medium_049_Anagrams_Test.TimeOut) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_049_Anagrams_Test.ProblemName, input: input, resultValue: Medium_049_Anagrams_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
