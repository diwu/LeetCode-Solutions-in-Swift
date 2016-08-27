//
//  Easy_021_Merge_Two_Sorted_Lists_Test.swift
//  Solutions
//
//  Created by Di Wu on 4/23/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_021_Merge_Two_Sorted_Lists_Test: XCTestCase {

    private static let ProblemName: String = "Easy_020_Valid_Parentheses"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value

    private typealias Node = Easy_021_Merge_Two_Sorted_Lists.Node

    func test_001() {
        var input: [Node] = [helper1([1]), helper1([2])]
        let expected: [Int] = [1, 2]
        let result: [Int] = helper2(Easy_021_Merge_Two_Sorted_Lists.mergeTwoLists(l1: input[0], l2: input[1]))
        assertHelper(expected == result, problemName: Easy_021_Merge_Two_Sorted_Lists_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
    }

    func test_002() {
        var input: [Node] = [helper1([0]), helper1([2])]
        let expected: [Int] = [2]
        let result: [Int] = helper2(Easy_021_Merge_Two_Sorted_Lists.mergeTwoLists(l1: nil, l2: input[1]))
        assertHelper(expected == result, problemName: Easy_021_Merge_Two_Sorted_Lists_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
    }

    func test_003() {
        var input: [Node] = [helper1([1]), helper1([0])]
        let expected: [Int] = [1]
        let result: [Int] = helper2(Easy_021_Merge_Two_Sorted_Lists.mergeTwoLists(l1: input[0], l2: nil))
        assertHelper(expected == result, problemName: Easy_021_Merge_Two_Sorted_Lists_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
    }

    func test_004() {
        let input: [Node] = [helper1([0]), helper1([0])]
        let expected: [Int] = []
        let result: [Int] = helper2(Easy_021_Merge_Two_Sorted_Lists.mergeTwoLists(l1: nil, l2: nil))
        assertHelper(expected == result, problemName: Easy_021_Merge_Two_Sorted_Lists_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
    }

    func test_005() {
        let input: [Node] = [helper1([1, 5]), helper1([2, 5, 6])]
        let expected: [Int] = [1, 2, 5, 5, 6]
        asyncHelper(input: input, expected: expected)
    }

    private func helper1(_ intArray: [Int]) -> Node {
        let dummy: Node = Node()
        var curr: Node = Node(value: intArray[0])
        dummy.next = curr
        for i in 1..<intArray.count {
            let temp: Node = Node(value: intArray[i])
            curr.next = temp
            curr = temp
        }
        return dummy.next!
    }

    private func helper2(_ n: Node?) -> [Int] {
        var node = n
        var res: [Int] = []
        while node != nil {
            res.append(node!.value)
            node = node?.next
        }
        return res
    }

    private func asyncHelper(input: [Node], expected: [Int] ) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Easy_021_Merge_Two_Sorted_Lists_Test.TimeOutName)
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async(execute: { () -> Void in
            let result: [Int] = self.helper2(Easy_021_Merge_Two_Sorted_Lists.mergeTwoLists(l1: input[0], l2: input[1]))
            assertHelper(expected == result, problemName: Easy_021_Merge_Two_Sorted_Lists_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Easy_021_Merge_Two_Sorted_Lists_Test.TimeOut) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Easy_021_Merge_Two_Sorted_Lists_Test.ProblemName, input: input, resultValue: Easy_021_Merge_Two_Sorted_Lists_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
