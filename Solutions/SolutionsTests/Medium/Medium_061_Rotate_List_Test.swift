//
//  Medium_061_Rotate_List_Test.swift
//  Solutions
//
//  Created by Di Wu on 6/22/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_061_Rotate_List_Test: XCTestCase, SolutionsTestCase {
    
    private typealias Node = Medium_061_Rotate_List.Node
    
    func test_001() {
        let input: [Any] = [[1, 2, 3, 4, 5], 2]
        let expected: [Int] = [4, 5, 1, 2, 3]
        asyncHelper(input: input, expected: expected)
    }
    
    func test_002() {
        let input: [Any] = [[1, 2, 3, 4, 5], 7]
        let expected: [Int] = [4, 5, 1, 2, 3]
        asyncHelper(input: input, expected: expected)
    }
    
    func test_003() {
        let input: [Any] = [[1, 2, 3, 4, 5], 1]
        let expected: [Int] = [5, 1, 2, 3, 4]
        asyncHelper(input: input, expected: expected)
    }
    
    func test_004() {
        let input: [Any] = [[0, 1, 2], 4]
        let expected: [Int] = [2, 0, 1]
        asyncHelper(input: input, expected: expected)
    }
    
    func test_005() {
        let input: [Any] = [[0, 1, 2], 0]
        let expected: [Int] = [0, 1, 2]
        asyncHelper(input: input, expected: expected)
    }
    
    func test_006() {
        let input: [Any] = [[], 99]
        let expected: [Int] = []
        asyncHelper(input: input, expected: expected)
    }
    
    func test_007() {
        let input: [Any] = [[1], 99]
        let expected: [Int] = [1]
        asyncHelper(input: input, expected: expected)
    }
    
    func test_008() {
        let input: [Any] = [[1, 2], 99]
        let expected: [Int] = [2, 1]
        asyncHelper(input: input, expected: expected)
    }
    
    func test_009() {
        let input: [Any] = [[1, 2], 100]
        let expected: [Int] = [1, 2]
        asyncHelper(input: input, expected: expected)
    }
    
    private func helper1(_ intArray: [Int]) -> Node? {
        var nodeArray: [Node] = []
        for i in intArray {
            let node: Node = Node()
            node.value = i
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
            res.append(localHead!.value!)
            localHead = localHead?.next
        }
        return res
    }
    
    func asyncHelper(input: [Any], expected: [Int]) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result: [Int] = self.helper2(Medium_061_Rotate_List.rotateRight(head: self.helper1(input[0] as! [Int]), k: input[1] as! Int))
            assertHelper(expected == result, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
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
