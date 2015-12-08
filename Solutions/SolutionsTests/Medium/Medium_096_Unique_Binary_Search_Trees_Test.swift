//
//  Medium_096_Unique_Binary_Search_Trees_Test.swift
//  Solutions
//
//  Created by Di Wu on 12/8/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_096_Unique_Binary_Search_Trees_Test: XCTestCase {
    private static let ProblemName: String = "Medium_096_Unique_Binary_Search_Trees"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: Int = 1
        let expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: Int = 3
        let expected: Int = 5
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: Int = 2
        let expected: Int = 2
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input input: Int, expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Medium_096_Unique_Binary_Search_Trees_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            let result_swift: Int = Medium_096_Unique_Binary_Search_Trees.numTrees(input)
            let result_objc: Int = ObjC_Medium_096_Unique_Binary_Search_Trees.numTrees(input)
            assertHelper(expected == result_swift, problemName: Medium_096_Unique_Binary_Search_Trees_Test.ProblemName, input: input, resultValue: result_swift, expectedValue: expected)
            assertHelper(expected == result_objc, problemName: Medium_096_Unique_Binary_Search_Trees_Test.ProblemName, input: input, resultValue: result_objc, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Medium_096_Unique_Binary_Search_Trees_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_096_Unique_Binary_Search_Trees_Test.ProblemName, input: input, resultValue: Medium_096_Unique_Binary_Search_Trees_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}