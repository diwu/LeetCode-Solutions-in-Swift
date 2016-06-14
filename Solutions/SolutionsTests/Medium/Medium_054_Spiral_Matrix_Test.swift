//
//  Medium_054_Spiral_Matrix_Test.swift
//  Solutions
//
//  Created by Di Wu on 6/6/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_054_Spiral_Matrix_Test: XCTestCase {
    private static let ProblemName: String = "Medium_054_Spiral_Matrix"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [[Int]] = [
            [ 1, 2, 3 ],
            [ 4, 5, 6 ],
            [ 7, 8, 9 ]
        ]
        let expected: [Int] = [1,2,3,6,9,8,7,4,5]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [[Int]] = [
            [ 1, 2, 3 ],
            [ 4, 5, 6 ],
            [ 7, 8, 9 ],
            [10,11,12 ]
        ]
        let expected: [Int] = [1,2,3,6,9,12,11,10,7,4,5,8]
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [[Int]] = [
            [ 1, 2, 3, 4 ],
            [ 5, 6, 7, 8 ],
            [ 9,10,11,12 ],
        ]
        let expected: [Int] = [1,2,3,4,8,12,11,10,9,5,6,7]
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [[Int]] = [
            [1]
        ]
        let expected: [Int] = [1]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [[Int]], expected: [Int]) {
        weak var expectation: XCTestExpectation? = self.expectation(withDescription: Medium_054_Spiral_Matrix_Test.TimeOutName)
        DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault).async(execute: { () -> Void in
            let result = Medium_054_Spiral_Matrix.spiralOrder(input)
            assertHelper(result == expected, problemName: Medium_054_Spiral_Matrix_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(withTimeout: Medium_054_Spiral_Matrix_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_054_Spiral_Matrix_Test.ProblemName, input: input, resultValue: Medium_054_Spiral_Matrix_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
