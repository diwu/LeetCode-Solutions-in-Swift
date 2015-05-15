//
//  Medium_024_Swap_Nodes_In_Pairs_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/5/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_024_Swap_Nodes_In_Pairs_Test: XCTestCase {
    private static let ProblemName: String = "Medium_024_Swap_Nodes_In_Pairs"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    private typealias Node = Medium_024_Swap_Nodes_In_Pairs.Node
    func test_001() {
        var input: Node? = helper1([1, 2, 3, 4])
        var expected: [Int] = [2, 1, 4, 3]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        var input: Node? = helper1([])
        var expected: [Int] = []
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        var input: Node? = helper1([1])
        var expected: [Int] = [1]
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        var input: Node? = helper1([1, 2])
        var expected: [Int] = [2, 1]
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        var input: Node? = helper1([1, 2, 3])
        var expected: [Int] = [2, 1, 3]
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        var input: Node? = helper1([1, 2, 3, 4, 5])
        var expected: [Int] = [2, 1, 4, 3, 5]
        asyncHelper(input: input, expected: expected)
    }
    private func helper1(intArray: [Int]) -> Node? {
        var nodeArray: [Node] = []
        for i in intArray {
            var node: Node = Node(value: i, next: nil)
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
    private func asyncHelper(# input: Node?, expected: [Int]) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Medium_024_Swap_Nodes_In_Pairs_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result: [Int] = self.helper2(Medium_024_Swap_Nodes_In_Pairs.swapPairs(input))
            assertHelper(expected == result, problemName: Medium_024_Swap_Nodes_In_Pairs_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Medium_024_Swap_Nodes_In_Pairs_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_024_Swap_Nodes_In_Pairs_Test.ProblemName, input: input, resultValue: Medium_024_Swap_Nodes_In_Pairs_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
