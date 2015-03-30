//
//  SolutionsTestsHelper.swift
//  Solutions
//
//  Created by Wu, Di on 3/30/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

func assertHelper(@autoclosure expression: () -> BooleanType, # problemName: String , # input: AnyObject, # resultValue: AnyObject, # expectedValue: AnyObject) {
    XCTAssert(expression(), "\n====================================\nProblem: \(problemName)\n====================================\nInput: \"\(input)\"\n====================================\nExpected: \"\(expectedValue)\"\n====================================\nResult: \"\(resultValue)\"\n====================================\n")
}