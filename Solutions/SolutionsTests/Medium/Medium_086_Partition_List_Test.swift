//
//  Medium_086_Partition_List_Test.swift
//  Solutions
//
//  Created by Di Wu on 10/13/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_086_Partition_List_Test: XCTestCase {
    private static let ProblemName: String = "Medium_086_Partition_List_Test"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    private typealias Node = Medium_086_Partition_List.Node
    func test_001() {
        let input0: [Int] = [1, 4, 3, 2, 5, 2]
        let input1: Int = 3
        let expected: [Int] = [1, 2, 2, 4, 3, 5]
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_002() {
        let input0: [Int] = []
        let input1: Int = 3
        let expected: [Int] = []
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    func test_003() {
        let input0: [Int] = [2, 1]
        let input1: Int = 1
        let expected: [Int] = [2, 1]
        asyncHelper(input0: input0, input1: input1, expected: expected)
    }
    private func helper1(intArray: [Int]) -> Node? {
        var nodeArray: [Node] = []
        for i in intArray {
            let node: Node = Node(value: i, next: nil)
            nodeArray.append(node)
        }
        if nodeArray.count == 0 {
            return nil
        }
        for i in 0..<nodeArray.count-1 {
            nodeArray[i].next = nodeArray[i+1]
        }
        return nodeArray[0]
    }
    private func helper2(head: Node?) -> [Int] {
        var res: [Int] = []
        var localHead = head
        while localHead != nil {
            res.append(localHead!.value)
            localHead = localHead?.next
        }
        return res
    }
    func asyncHelper(input0 input0: [Int], input1: Int, expected: [Int]) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Medium_086_Partition_List_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            let result: [Int] = self.helper2(Medium_086_Partition_List.partition(head: self.helper1(input0), x: input1))
            assertHelper(expected == result, problemName: Medium_086_Partition_List_Test.ProblemName, input: input0, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Medium_086_Partition_List_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_086_Partition_List_Test.ProblemName, input: input0, resultValue: Medium_086_Partition_List_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
