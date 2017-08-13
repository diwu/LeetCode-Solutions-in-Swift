//
//  Easy_102_Binary_Tree_Level_Order_Traversal_Test.swift
//  Solutions
//
//  Created by Jingdong on 10/17/16.
//  Copyright © 2016 diwu. All rights reserved.
//

import XCTest

class Easy_102_Binary_Tree_Level_Order_Traversal_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Easy_102_Binary_Tree_Level_Order_Traversal"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    private typealias Node_Swift = Easy_102_Binary_Tree_Level_Order_Traversal.Node
    private func convertArrayToTree_swift(_ arr: [Int]) -> Node_Swift? {
        guard arr.count > 0 else {
            return nil
        }
        let root: Node_Swift = Node_Swift.init(value: arr[0], left: nil, right: nil)
        var fifoQueue: [Node_Swift] = [root]
        var i = 1
        while i < arr.count {
            let node: Node_Swift = fifoQueue.removeFirst()
            if arr[i] == Int.min {
                node.left = nil
            } else {
                node.left = Node_Swift.init(value: arr[i], left: nil, right: nil)
                fifoQueue.append(node.left!)
            }
            if arr[i+1] == Int.min {
                node.right = nil
            } else {
                node.right = Node_Swift.init(value: arr[i+1], left: nil, right: nil)
                fifoQueue.append(node.right!)
            }
            i += 2
        }
        return root
    }
    func test_001() {
        let input: [Int] = [3, 9, 20, 15, 7]
        let expected: [[Int]] =  [
            [3],
            [9,20],
            [15,7]
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Int] = []
        let expected: [[Int]] =  [
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Int] = [3, Int.min, 20, 15, 7]
        let expected: [[Int]] =  [
            [3],
            [20],
            [15,7]
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [Int] = [3, Int.min, 20, 15, 7, 8, Int.min, Int.min, 9]
        let expected: [[Int]] =  [
            [3],
            [20],
            [15,7],
            [8, 9]
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [Int] = [3, Int.min, 20, 15, 7, Int.min, 8, 9, Int.min]
        let expected: [[Int]] =  [
            [3],
            [20],
            [15,7],
            [8, 9]
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: [Int] = [3]
        let expected: [[Int]] =  [
            [3]
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: [Int] = [3, 20, Int.min,  15, 7]
        let expected: [[Int]] =  [
            [3],
            [20],
            [15,7]
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        let input: [Int] = [1, 2, 3, 4, 5, 6, 7, Int.min, Int.min, Int.min, Int.min, Int.min, Int.min, Int.min, 8]
        let expected: [[Int]] =  [
            [1],
            [2, 3],
            [4, 5, 6, 7],
            [8]
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        let input: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, Int.min]
        let expected: [[Int]] =  [
            [1],
            [2, 3],
            [4, 5, 6, 7],
            [8]
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_010() {
        let input: [Int] = [1, 2, 3, 4, 5, 6, 7, Int.min, Int.min, Int.min, Int.min, Int.min, 8]
        let expected: [[Int]] =  [
            [1],
            [2, 3],
            [4, 5, 6, 7],
            [8]
        ]
        asyncHelper(input: input, expected: expected)
    }
    func test_011() {
        let input: [Int] = [1, 2, 3, 4, 5, 6, 7, Int.min, Int.min, Int.min, Int.min, 8, Int.min]
        let expected: [[Int]] =  [
            [1],
            [2, 3],
            [4, 5, 6, 7],
            [8]
        ]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [Int], expected: [[Int]]) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Easy_102_Binary_Tree_Level_Order_Traversal_Test.TimeOutName)
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async(execute: { () -> Void in
            let result: [[Int]] = Easy_102_Binary_Tree_Level_Order_Traversal.levelOrder(self.convertArrayToTree_swift(input))
            assertHelper(compareTwoDimensionIntArray(arr0: expected, arr1: result), problemName: Easy_102_Binary_Tree_Level_Order_Traversal_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Easy_102_Binary_Tree_Level_Order_Traversal_Test.TimeOut) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Easy_102_Binary_Tree_Level_Order_Traversal_Test.ProblemName, input: input, resultValue: Easy_102_Binary_Tree_Level_Order_Traversal_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
