//
//  Medium_098_Validate_Binary_Search_Tree_Test.swift
//  Solutions
//
//  Created by Di Wu on 12/9/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_098_Validate_Binary_Search_Tree_Test: XCTestCase {
    private static let ProblemName: String = "Medium_098_Validate_Binary_Search_Tree"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    private typealias Node_Swift = Medium_098_Validate_Binary_Search_Tree.Node
    private typealias Node_ObjC = ObjC_Medium_098_Validate_Binary_Search_Tree_Node
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
        let input: [Int] = [4, 2, 6, 1, 3, 5, 7]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Int] = [4, 2, 6, 1, 3, 5, -1]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Int] = [4, 2, 6, Int.min, 3, 5, Int.min]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [Int] = [1]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [Int] = [40, 20, 60, 10, 30, 50, 70, Int.min, 11, 29, Int.min, 49, 51, 69, 71]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: [Int] = [40, 20, 60, 10, 30, 50, 70, Int.min, 21, 29, Int.min, 49, 51, 69, 71]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [Int], expected: Bool) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Medium_098_Validate_Binary_Search_Tree_Test.TimeOutName)
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async(execute: { () -> Void in
            let result_swift: Bool = Medium_098_Validate_Binary_Search_Tree.isValidBST(self.convertArrayToTree_swift(input))
            let result_objc: Bool = ObjC_Medium_098_Validate_Binary_Search_Tree.isValidBST(self.convertArrayToTree_objc(input))
            assertHelper(expected == result_swift, problemName: Medium_098_Validate_Binary_Search_Tree_Test.ProblemName, input: input, resultValue: result_swift, expectedValue: expected)
            assertHelper(expected == result_objc, problemName: Medium_098_Validate_Binary_Search_Tree_Test.ProblemName, input: input, resultValue: result_objc, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Medium_098_Validate_Binary_Search_Tree_Test.TimeOut) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_098_Validate_Binary_Search_Tree_Test.ProblemName, input: input, resultValue: Medium_098_Validate_Binary_Search_Tree_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}

