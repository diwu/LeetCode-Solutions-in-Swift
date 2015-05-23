//
//  Hard_045_Jump_Game_II.swift
//  Solutions
//
//  Created by Di Wu on 5/23/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import Foundation

struct Hard_045_Jump_Game_II {
    static func jump(nums: [Int]) -> Int {
        var result = 0;
        var last = 0;
        var curr = 0;
        for var i = 0; i < count(nums); i++ {
            if (i > last) {
                last = curr;
                result++;
            }
            curr = max(curr, i+nums[i]);
        }
        return result;
    }
}