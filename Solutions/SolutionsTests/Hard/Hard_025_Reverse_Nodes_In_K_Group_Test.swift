//
//  Hard_025_Reverse_Nodes_In_K_Group_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/6/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Hard_025_Reverse_Nodes_In_K_Group_Test: XCTestCase {
    private static let ProblemName: String = "Hard_025_Reverse_Nodes_In_K_Group"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    private typealias Node = Hard_025_Reverse_Nodes_In_K_Group.Node
    func test_001() {
        let input: [AnyObject?] = [helper1([1, 2, 3, 4]), 2]
        let expected: [Int] = [2, 1, 4, 3]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [AnyObject?] = [helper1([1, 2, 3, 4]), 1]
        let expected: [Int] = [1, 2, 3, 4]
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [AnyObject?] = [helper1([1, 2, 3, 4]), 3]
        let expected: [Int] = [3, 2, 1, 4]
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [AnyObject?] = [helper1([]), 3]
        let expected: [Int] = []
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [AnyObject?] = [helper1([1, 2, 3, 4]), 999]
        let expected: [Int] = [1, 2, 3, 4]
        asyncHelper(input: input, expected: expected)
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
    private func asyncHelper(input  input: [AnyObject?], expected: [Int]) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Hard_025_Reverse_Nodes_In_K_Group_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result: [Int]
            if input[0] != nil {
                let head: Node = input[0] as! Node
                result = self.helper2(Hard_025_Reverse_Nodes_In_K_Group.reverseKGroup(head: head, k: input[1] as! Int))
            } else {
                result = self.helper2(Hard_025_Reverse_Nodes_In_K_Group.reverseKGroup(head: nil, k: input[1] as! Int))
            }
            assertHelper(expected == result, problemName: Hard_025_Reverse_Nodes_In_K_Group_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Hard_025_Reverse_Nodes_In_K_Group_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Hard_025_Reverse_Nodes_In_K_Group_Test.ProblemName, input: input, resultValue: Hard_025_Reverse_Nodes_In_K_Group_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
