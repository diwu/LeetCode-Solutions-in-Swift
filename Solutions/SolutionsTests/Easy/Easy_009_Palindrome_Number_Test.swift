//
//  Easy_009_Palindrome_Number_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/27/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_009_Palindrome_Number_Test: XCTestCase {

    private static let ProblemName: String = "Easy_009_Palindrome_Number"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value

    func test_001() {
        var input: Int = -121
        var expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        var input: Int = 121
        var expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        var input: Int = 0
        var expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        var input: Int = Int.max
        var expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        var input: Int = Int.min
        var expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        var input: Int = 1999999999999999999
        var expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        var input: Int = -1999999999999999999
        var expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func asyncHelper(# input: Int, expected: Bool ) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Easy_009_Palindrome_Number_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result: Bool = Easy_009_Palindrome_Number.isPalindrome(input)
            assertHelper(result == expected, problemName: Easy_009_Palindrome_Number_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Easy_009_Palindrome_Number_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Easy_009_Palindrome_Number_Test.ProblemName, input: input, resultValue: Easy_009_Palindrome_Number_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}

/*
isPalindrome(-121)                  //false
isPalindrome(121)                   //true
isPalindrome(0)                     //true
isPalindrome(Int.max)               //false
isPalindrome(Int.min)               //false
isPalindrome(1999999999999999999)   //false, overflow handling
isPalindrome(-1999999999999999999)  //false, overflow handling
*/
