//
//  SolutionsTestsHelper.swift
//  Solutions
//
//  Created by Wu, Di on 3/30/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

let Default_Timeout_Value = 0.01
let Default_Timeout_Suffix: String = " Time Out"

func assertHelper(@autoclosure expression: () -> BooleanType, # problemName: String , # input: Any, # resultValue: Any, # expectedValue: Any) {
    XCTAssert(expression(), "\n====================================\nProblem: \(problemName)\n====================================\nInput: \"\(input)\"\n====================================\nExpected: \"\(expectedValue)\"\n====================================\nResult: \"\(resultValue)\"\n====================================\n")
}

func unwrap(any:Any) -> Any? {
    let mi:MirrorType = reflect(any)
    if mi.disposition != .Optional {
        return any
    }
    if mi.count == 0 { return nil }
    let (name,some) = mi[0]
    return some.value
}