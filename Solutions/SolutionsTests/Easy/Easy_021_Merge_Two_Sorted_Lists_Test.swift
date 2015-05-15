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
        var expected: [Int] = [1, 2]
        var result: [Int] = helper2(Easy_021_Merge_Two_Sorted_Lists.mergeTwoLists(l1: input[0], l2: input[1]))
        assertHelper(expected == result, problemName: Easy_021_Merge_Two_Sorted_Lists_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
    }

    func test_002() {
        var input: [Node] = [helper1([0]), helper1([2])]
        var expected: [Int] = [2]
        var result: [Int] = helper2(Easy_021_Merge_Two_Sorted_Lists.mergeTwoLists(l1: nil, l2: input[1]))
        assertHelper(expected == result, problemName: Easy_021_Merge_Two_Sorted_Lists_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
    }

    func test_003() {
        var input: [Node] = [helper1([1]), helper1([0])]
        var expected: [Int] = [1]
        var result: [Int] = helper2(Easy_021_Merge_Two_Sorted_Lists.mergeTwoLists(l1: input[0], l2: nil))
        assertHelper(expected == result, problemName: Easy_021_Merge_Two_Sorted_Lists_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
    }

    func test_004() {
        var input: [Node] = [helper1([0]), helper1([0])]
        var expected: [Int] = []
        var result: [Int] = helper2(Easy_021_Merge_Two_Sorted_Lists.mergeTwoLists(l1: nil, l2: nil))
        assertHelper(expected == result, problemName: Easy_021_Merge_Two_Sorted_Lists_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
    }

    func test_005() {
        var input: [Node] = [helper1([1, 5]), helper1([2, 5, 6])]
        var expected: [Int] = [1, 2, 5, 5, 6]
        asyncHelper(input: input, expected: expected)
    }

    private func helper1(intArray: [Int]) -> Node {
        var dummy: Node = Node()
        var curr: Node = Node(value: intArray[0])
        dummy.next = curr
        for i in 1..<intArray.count {
            var temp: Node = Node(value: intArray[i])
            curr.next = temp
            curr = temp
        }
        return dummy.next!
    }

    private func helper2(var node: Node?) -> [Int] {
        var res: [Int] = []
        while node != nil {
            res.append(node!.value)
            node = node?.next
        }
        return res
    }

    private func asyncHelper(# input: [Node], expected: [Int] ) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Easy_021_Merge_Two_Sorted_Lists_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result: [Int] = self.helper2(Easy_021_Merge_Two_Sorted_Lists.mergeTwoLists(l1: input[0], l2: input[1]))
            assertHelper(expected == result, problemName: Easy_021_Merge_Two_Sorted_Lists_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Easy_021_Merge_Two_Sorted_Lists_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Easy_021_Merge_Two_Sorted_Lists_Test.ProblemName, input: input, resultValue: Easy_021_Merge_Two_Sorted_Lists_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
