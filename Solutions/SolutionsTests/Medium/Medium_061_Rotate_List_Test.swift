//
//  Medium_061_Rotate_List_Test.swift
//  Solutions
//
//  Created by Di Wu on 6/22/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_061_Rotate_List_Test: XCTestCase {
    private static let ProblemName: String = "Medium_061_Rotate_List"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    
    private typealias Node = Medium_061_Rotate_List.Node
    
    func test_001() {
        let input: [AnyObject] = [[1, 2, 3, 4, 5], 2]
        let expected: [Int] = [4, 5, 1, 2, 3]
        asyncHelper(input: input, expected: expected)
    }
    
    func test_002() {
        let input: [AnyObject] = [[1, 2, 3, 4, 5], 7]
        let expected: [Int] = [4, 5, 1, 2, 3]
        asyncHelper(input: input, expected: expected)
    }
    
    func test_003() {
        let input: [AnyObject] = [[1, 2, 3, 4, 5], 1]
        let expected: [Int] = [5, 1, 2, 3, 4]
        asyncHelper(input: input, expected: expected)
    }
    
    func test_004() {
        let input: [AnyObject] = [[0, 1, 2], 4]
        let expected: [Int] = [2, 0, 1]
        asyncHelper(input: input, expected: expected)
    }
    
    func test_005() {
        let input: [AnyObject] = [[0, 1, 2], 0]
        let expected: [Int] = [0, 1, 2]
        asyncHelper(input: input, expected: expected)
    }
    
    func test_006() {
        let input: [AnyObject] = [[], 99]
        let expected: [Int] = []
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
    
    func asyncHelper(input  input: [AnyObject], expected: [Int]) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Medium_061_Rotate_List_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            let result: [Int] = self.helper2(Medium_061_Rotate_List.rotateRight(head: self.helper1(input[0] as! [Int]), k: input[1] as! Int))
            assertHelper(expected == result, problemName: Medium_061_Rotate_List_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Medium_061_Rotate_List_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_061_Rotate_List_Test.ProblemName, input: input, resultValue: Medium_061_Rotate_List_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
