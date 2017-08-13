//
//  Hard_099_Recover_Binary_Search_Tree_Test.swift
//  Solutions
//
//  Created by Di Wu on 12/9/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Hard_099_Recover_Binary_Search_Tree_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Hard_099_Recover_Binary_Search_Tree"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    private typealias Node_Swift = Hard_099_Recover_Binary_Search_Tree.Node
    private typealias Node_ObjC = ObjC_Hard_099_Recover_Binary_Search_Tree_Node
    private func convertTreeToArray_swift(_ root: Node_Swift?) -> [Int] {
        var ret: [Int] = []
        if root == nil {
            return ret
        } else {
            var fifoQueue: [Node_Swift?] = []
            fifoQueue.append(root!)
            while fifoQueue.count > 0 {
                let curr: Node_Swift? = fifoQueue.removeFirst()
                if curr == nil {
                    ret.append(Int.min)
                } else {
                    ret.append((curr?.value)!)
                    fifoQueue.append(curr?.left)
                    fifoQueue.append(curr?.right)
                }
            }
            return ret
        }
    }
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
    private func convertTreeToArray_objc(_ root: Node_ObjC?) -> [Int] {
        var ret: [Int] = []
        if root == nil {
            return ret
        } else {
            var fifoQueue: [Node_ObjC?] = []
            fifoQueue.append(root!)
            while fifoQueue.count > 0 {
                let curr: Node_ObjC? = fifoQueue.removeFirst()
                if curr == nil {
                    ret.append(Int.min)
                } else {
                    ret.append((curr?.value)!)
                    fifoQueue.append(curr?.left)
                    fifoQueue.append(curr?.right)
                }
            }
            return ret
        }
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
        let input: [Int] = [4, 2, 3, 1, 6, 5, 7]
        let expected: [Int] = [4, 2, 6, 1, 3, 5, 7]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Int] = [71, 20, 60, 10, 30, 50, 70, Int.min, 11, 29, Int.min, 49, 51, 69, 40]
        let expected: [Int] = [40, 20, 60, 10, 30, 50, 70, Int.min, 11, 29, Int.min, 49, 51, 69, 71]
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Int] = [40, 69, 60, 10, 30, 50, 70, Int.min, 11, 29, Int.min, 49, 51, 20, 71]
        let expected: [Int] = [40, 20, 60, 10, 30, 50, 70, Int.min, 11, 29, Int.min, 49, 51, 69, 71]
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [Int] = [40, 20, 11, 10, 30, 50, 70, Int.min, 60, 29, Int.min, 49, 51, 69, 71]
        let expected: [Int] = [40, 20, 60, 10, 30, 50, 70, Int.min, 11, 29, Int.min, 49, 51, 69, 71]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [Int], expected: [Int]) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Hard_099_Recover_Binary_Search_Tree_Test.TimeOutName)
        serialQueue().async(execute: { () -> Void in
            let node_swift: Node_Swift = self.convertArrayToTree_swift(input)
            let node_objc: Node_ObjC = self.convertArrayToTree_objc(input)
            let result_swift: Node_Swift? = Hard_099_Recover_Binary_Search_Tree.recoverTree(node_swift)
            let result_objc: Node_ObjC? = ObjC_Hard_099_Recover_Binary_Search_Tree.recover(node_objc)
            let result_array_swift: [Int] = self.convertTreeToArray_swift(result_swift)
            let result_array_objc: [Int] = self.convertTreeToArray_objc(result_objc)
            assertHelper(expected == Array<Int>(result_array_swift.prefix(upTo: expected.count)), problemName:self.problemName(), input: input, resultValue: result_array_swift, expectedValue: expected)
            assertHelper(expected == Array<Int>(result_array_objc.prefix(upTo: expected.count)), problemName:self.problemName(), input: input, resultValue: result_array_objc, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout:timeOut()) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input, resultValue: Hard_099_Recover_Binary_Search_Tree_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
