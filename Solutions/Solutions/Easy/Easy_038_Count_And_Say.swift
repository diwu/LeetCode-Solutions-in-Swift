/*

https://leetcode.com/problems/count-and-say/

#38 Count and Say

Level: easy

The count-and-say sequence is the sequence of integers beginning as follows:
1, 11, 21, 1211, 111221, ...

1 is read off as "one 1" or 11.
11 is read off as "two 1s" or 21.
21 is read off as "one 2, then one 1" or 1211.
Given an integer n, generate the nth sequence.

Note: The sequence of integers will be represented as a string.

Inspired by @zerobased at https://leetcode.com/discuss/7678/show-an-answer-in-java

*/

import Foundation

private extension String {
    subscript (index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}

class Easy_038_Count_And_Say {
    class func countAndSay(_ n: Int) -> String {
        var result: String = "1"
        for _ in 0 ..< n {
            let previous: String = result
            result = ""
            var counter = 1
            var say: Character = previous[0]
            for j in 1 ..< previous.count {
                if previous[j] != say {
                    result = "\(result)\(counter)\(say)"
                    counter = 1
                    say = previous[j]
                } else {
                    counter += 1
                }
            }
            result = "\(result)\(counter)\(say)"
        }
        return result
    }
}
