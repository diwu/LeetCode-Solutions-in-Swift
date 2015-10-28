//
//  Medium_092_Reverse_Linked_List_II_Test.swift
//  Solutions
//
//  Created by Di Wu on 10/28/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_092_Reverse_Linked_List_II_Test: XCTestCase {
    private static let ProblemName: String = "Medium_086_Partition_List_Test"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    private typealias Node = Medium_092_Reverse_Linked_List_II.Node
    private typealias ObjC_Node = ObjC_Medium_092_Reverse_Linked_List_II_Node
    func test_001() {
        let input0: [Int] = [1, 2, 3, 4, 5]
        let input1: Int = 2
        let input2: Int = 4
        let expected: [Int] = [1, 4, 3, 2, 5]
        asyncHelper(input0: input0, input1: input1, input2: input2, expected: expected)
    }
    func test_002() {
        let input0: [Int] = [1]
        let input1: Int = 1
        let input2: Int = 1
        let expected: [Int] = [1]
        asyncHelper(input0: input0, input1: input1, input2: input2, expected: expected)
    }
    func test_003() {
        let input0: [Int] = [1, 2, 3, 4, 5]
        let input1: Int = 4
        let input2: Int = 5
        let expected: [Int] = [1, 2, 3, 5, 4]
        asyncHelper(input0: input0, input1: input1, input2: input2, expected: expected)
    }
    func test_004() {
        let input0: [Int] = [1, 2]
        let input1: Int = 1
        let input2: Int = 1
        let expected: [Int] = [1, 2]
        asyncHelper(input0: input0, input1: input1, input2: input2, expected: expected)
    }
    func test_005() {
        let input0: [Int] = [1, 2]
        let input1: Int = 2
        let input2: Int = 2
        let expected: [Int] = [1, 2]
        asyncHelper(input0: input0, input1: input1, input2: input2, expected: expected)
    }
    func test_006() {
        let input0: [Int] = [1, 2, 3, 4, 5]
        let input1: Int = 2
        let input2: Int = 3
        let expected: [Int] = [1, 3, 2, 4, 5]
        asyncHelper(input0: input0, input1: input1, input2: input2, expected: expected)
    }
    func test_007() {
        let input0: [Int] = [1, 2, 3, 4, 5]
        let input1: Int = 1
        let input2: Int = 2
        let expected: [Int] = [2, 1, 3, 4, 5]
        asyncHelper(input0: input0, input1: input1, input2: input2, expected: expected)
    }
    func asyncHelper(input0 input0: [Int], input1: Int, input2: Int, expected: [Int]) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Medium_092_Reverse_Linked_List_II_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            let result_swift: [Int] = self.helper2(Medium_092_Reverse_Linked_List_II.reverseBetween(self.helper1(input0), m: input1, n: input2))
            assertHelper(expected == result_swift, problemName: Medium_092_Reverse_Linked_List_II_Test.ProblemName, input: input0, resultValue: result_swift, expectedValue: expected)
            let result_objc: [Int] = self.objc_helper2(ObjC_Medium_092_Reverse_Linked_List_II.reverseBetween(self.objc_helper1(input0), m: input1, n: input2))
            assertHelper(expected == result_objc, problemName: Medium_092_Reverse_Linked_List_II_Test.ProblemName, input: input0, resultValue: result_objc, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Medium_092_Reverse_Linked_List_II_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_092_Reverse_Linked_List_II_Test.ProblemName, input: input0, resultValue: Medium_092_Reverse_Linked_List_II_Test.TimeOutName, expectedValue: expected)
            }
        }
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
    private func objc_helper1(intArray: [Int]) -> ObjC_Node? {
        var nodeArray: [ObjC_Node] = []
        for i in intArray {
            let node: ObjC_Node = ObjC_Node(i, next: nil)
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
    private func objc_helper2(head: ObjC_Node?) -> [Int] {
        var res: [Int] = []
        var localHead = head
        while localHead != nil {
            res.append(localHead!.value)
            localHead = localHead?.next
        }
        return res
    }
}