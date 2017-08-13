//
//  Easy_058_Length_Of_Last_Word_Test.swift
//  Solutions
//
//  Created by Di Wu on 6/16/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Easy_058_Length_Of_Last_Word_Test: XCTestCase, SolutionsTestCase {
    func test_001() {
        let input: String = "Hello World"
        let expected: Int = 5
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: String = ""
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: String = "  asd   "
        let expected: Int = 3
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: String = "  asd   a"
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: String = "  asd   a baddsd asddddf asdsdfe wedr asdfddas dfae   "
        let expected: Int = 4
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: String = "  asd   a baddsd asddddf asdsdfe wedr asdfddas dfae"
        let expected: Int = 4
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: String = "abcde"
        let expected: Int = 5
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: String, expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result: Int = Easy_058_Length_Of_Last_Word.lengthOfLastWord(input)
            assertHelper(expected == result, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
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
