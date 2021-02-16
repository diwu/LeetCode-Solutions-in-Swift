//
//  Medium_095_Unique_Binary_Search_Trees_II_Test.swift
//  Solutions
//
//  Created by Di Wu on 11/20/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_095_Unique_Binary_Search_Trees_II_Test: XCTestCase, SolutionsTestCase {
    private typealias Node_Swift = Medium_095_Unique_Binary_Search_Trees_II.Node
    private typealias Node_ObjC = ObjC_Medium_095_Unique_Binary_Search_Trees_II_Node
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
    private func convertTreeToArray_objc(_ root: Node_ObjC?) -> [Int] {
        var ret: [Int] = []
        if root == nil || root!.isKind(of: Node_ObjC.self) == false {
            return ret
        } else {
            var fifoQueue: [Node_ObjC?] = []
            fifoQueue.append(root)
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
    func test_001() {
        let input: Int = 1
        let expected: NSSet = NSSet(array: [
            [1, Int.min, Int.min]
            ])
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: Int = 2
        let expected: NSSet = NSSet(array: [
            [2, 1, Int.min, Int.min, Int.min],
            [1, Int.min, 2, Int.min, Int.min],
            ])
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: Int = 3
        let expected: NSSet = NSSet(array: [
            [1, Int.min, 3, 2, Int.min, Int.min, Int.min],
            [3, 2, Int.min, 1, Int.min, Int.min, Int.min],
            [3, 1, Int.min, Int.min, 2, Int.min, Int.min],
            [2, 1, 3, Int.min, Int.min, Int.min, Int.min],
            [1, Int.min, 2, Int.min, 3, Int.min, Int.min],
            ])
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: Int, expected: NSSet) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result_swift: [Node_Swift?] = Medium_095_Unique_Binary_Search_Trees_II.generateTrees(input)
            let result_objc: [Any] = ObjC_Medium_095_Unique_Binary_Search_Trees_II.generateTrees(input)
            var int_arr_swift: [[Int]] = []
            var int_arr_objc: [[Int]] = []
            for node in result_swift {
                int_arr_swift.append(self.convertTreeToArray_swift(node))
            }
            for n in result_objc {
                let node = n as! Node_ObjC
                int_arr_objc.append(self.convertTreeToArray_objc(node))
            }
            assertHelper(expected == NSSet(array: int_arr_swift), problemName:self.problemName(), input: input, resultValue: int_arr_swift, expectedValue: expected)
            assertHelper(expected == NSSet(array: int_arr_objc), problemName:self.problemName(), input: input, resultValue: int_arr_objc, expectedValue: expected)
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
