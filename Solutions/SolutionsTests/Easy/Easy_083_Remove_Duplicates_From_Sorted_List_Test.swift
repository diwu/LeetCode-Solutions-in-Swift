//
//  Easy_083_Remove_Duplicates_From_Sorted_List_Test.swift
//  Solutions
//
//  Created by Di Wu on 9/25/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Easy_083_Remove_Duplicates_From_Sorted_List_Test: XCTestCase, SolutionsTestCase {
    private static let ProblemName: String = "Easy_083_Remove_Duplicates_From_Sorted_List"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    private typealias Node = Easy_083_Remove_Duplicates_From_Sorted_List.Node
    func test_001() {
        let input: [Int] = [1, 2, 3, 3, 4, 4, 5]
        let expected: [Int] = [1, 2, 3, 4, 5]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Int] = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5]
        let expected: [Int] = [1, 2, 3, 4, 5]
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Int] = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6]
        let expected: [Int] = [1, 2, 3, 4, 5, 6]
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [Int] = [0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5]
        let expected: [Int] = [0, 1, 2, 3, 4, 5]
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [Int] = [1, 1, 2, 2, 3, 4, 4, 5, 5]
        let expected: [Int] = [1, 2, 3, 4, 5]
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: [Int] = []
        let expected: [Int] = []
        asyncHelper(input: input, expected: expected)
    }
    private func helper1(_ intArray: [Int]) -> Node? {
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
    private func helper2(_ head: Node?) -> [Int] {
        var res: [Int] = []
        var localHead = head
        while localHead != nil {
            res.append(localHead!.value)
            localHead = localHead?.next
        }
        return res
    }
    func asyncHelper(input: [Int], expected: [Int]) {
        weak var expectation: XCTestExpectation? = self.expectation(description: Easy_083_Remove_Duplicates_From_Sorted_List_Test.TimeOutName)
        serialQueue().async(execute: { () -> Void in
            let result: [Int] = self.helper2(Easy_083_Remove_Duplicates_From_Sorted_List.deleteDuplicates(self.helper1(input)))
            assertHelper(expected == result, problemName: Easy_083_Remove_Duplicates_From_Sorted_List_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout: Easy_083_Remove_Duplicates_From_Sorted_List_Test.TimeOut) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Easy_083_Remove_Duplicates_From_Sorted_List_Test.ProblemName, input: input, resultValue: Easy_083_Remove_Duplicates_From_Sorted_List_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
