//
//  Medium_095_Unique_Binary_Search_Trees_II_Test.swift
//  Solutions
//
//  Created by Di Wu on 11/20/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_095_Unique_Binary_Search_Trees_II_Test: XCTestCase {
    private static let ProblemName: String = "Medium_095_Unique_Binary_Search_Trees_II"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    private typealias Node_Swift = Medium_095_Unique_Binary_Search_Trees_II.Node
    private func convertTreeToArray_swift(root: Node_Swift?) -> [Int] {
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
            [1, 1, Int.min, Int.min, Int.min],
            [1, Int.min, 1, Int.min, Int.min],
            ])
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: Int = 3
        let expected: NSSet = NSSet(array: [
            [1, Int.min, 1, 1, Int.min, Int.min, Int.min],
            [1, 1, Int.min, 1, Int.min, Int.min, Int.min],
            [1, 1, Int.min, Int.min, 1, Int.min, Int.min],
            [1, 1, 1, Int.min, Int.min, Int.min, Int.min],
            [1, Int.min, 1, Int.min, 1, Int.min, Int.min],
            ])
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input input: Int, expected: NSSet) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Medium_095_Unique_Binary_Search_Trees_II_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            let result_swift: [Node_Swift?] = Medium_095_Unique_Binary_Search_Trees_II.generateTrees(input)
            var int_arr_swift: [[Int]] = []
            for node in result_swift {
                int_arr_swift.append(self.convertTreeToArray_swift(node))
            }
            assertHelper(expected == NSSet(array: int_arr_swift), problemName: Medium_095_Unique_Binary_Search_Trees_II_Test.ProblemName, input: input, resultValue: result_swift, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Medium_095_Unique_Binary_Search_Trees_II_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_095_Unique_Binary_Search_Trees_II_Test.ProblemName, input: input, resultValue: Medium_095_Unique_Binary_Search_Trees_II_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}