//
//  Easy_101_Symmetric_Tree_Test.swift
//  Solutions
//
//  Created by Di Wu on 12/19/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Easy_101_Symmetric_Tree_Test: XCTestCase {
    private static let ProblemName: String = "Easy_101_Symmetric_Tree"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    private typealias Node_Swift = Easy_101_Symmetric_Tree.Node
    private typealias Node_ObjC = ObjC_Easy_101_Symmetric_Tree_Node
    private func convertArrayToTree_swift(_ arr: [Int]) -> Node_Swift {
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
    private func convertArrayToTree_objc(_ arr: [Int]) -> Node_ObjC {
        let root: Node_ObjC = Node_ObjC.init(value: arr[0], left: nil, right: nil)
        var fifoQueue: [Node_ObjC] = [root]
        var i = 1
        while i < arr.count {
            let node: Node_ObjC = fifoQueue.removeFirst()
            if arr[i] == Int.min {
                node.left = nil
            } else {
                node.left = Node_ObjC.init(value: arr[i], left: nil, right: nil)
                fifoQueue.append(node.left!)
            }
            if arr[i+1] == Int.min {
                node.right = nil
            } else {
                node.right = Node_ObjC.init(value: arr[i+1], left: nil, right: nil)
                fifoQueue.append(node.right!)
            }
            i += 2
        }
        return root
    }
    func test_001() {
        let input: [Int] = [1, 2, 2, 4, 3, 3, 4]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Int] = [1, 2, 2, 4, 3, 3, 4, 1, Int.min]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [Int], expected: Bool) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Easy_101_Symmetric_Tree_Test.TimeOutName)
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async(execute: { () -> Void in
            let result_swift: Bool = Easy_101_Symmetric_Tree.isSymmetric(self.convertArrayToTree_swift(input))
            let result_objc: Bool = ObjC_Easy_101_Symmetric_Tree.isSymmetric(self.convertArrayToTree_objc(input))
            assertHelper(expected == result_swift, problemName: Easy_101_Symmetric_Tree_Test.ProblemName, input: input, resultValue: result_swift, expectedValue: expected)
            assertHelper(expected == result_objc, problemName: Easy_101_Symmetric_Tree_Test.ProblemName, input: input, resultValue: result_objc, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Easy_101_Symmetric_Tree_Test.TimeOut) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Easy_101_Symmetric_Tree_Test.ProblemName, input: input, resultValue: Easy_101_Symmetric_Tree_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
