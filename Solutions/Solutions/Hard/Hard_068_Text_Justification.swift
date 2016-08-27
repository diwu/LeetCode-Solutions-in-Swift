/*

https://leetcode.com/problems/text-justification/

#68 Text Justification 

Level: hard

Given an array of words and a length L, format the text such that each line has exactly L characters and is fully (left and right) justified.

You should pack your words in a greedy approach; that is, pack as many words as you can in each line. Pad extra spaces ' ' when necessary so that each line has exactly L characters.

Extra spaces between words should be distributed as evenly as possible. If the number of spaces on a line do not divide evenly between words, the empty slots on the left will be assigned more spaces than the slots on the right.

For the last line of text, it should be left justified and no extra space is inserted between words.

For example,
words: ["This", "is", "an", "example", "of", "text", "justification."]
L: 16.

Return the formatted lines as:
[
"This    is    an",
"example  of text",
"justification.  "
]
Note: Each word is guaranteed not to exceed L in length.

click to show corner cases.

Corner Cases:
A line other than the last line might contain only one word. What should you do in this case?
In this case, that line should be left-justified.

Inspired by @qddpx at https://leetcode.com/discuss/13610/share-my-concise-c-solution-less-than-20-lines

*/

import Foundation

struct Hard_068_Text_Justification {
    static func fullJustify(_ words: [String], maxWidth: Int) -> [String] {
        var res: [String] = []
        var i = 0
        var k: Int
        var l: Int
        while i < words.count {
            k = 0
            l = 0
            while i + k < words.count && l + words[i+k].characters.count <= maxWidth - k {
                l += words[i+k].characters.count
                k += 1
            }
            var tmp = words[i]
            for j in 0 ..< k-1 {
                if i + k >= words.count {
                    tmp += " "
                } else {
                    var tmpLen = (maxWidth - l) / (k - 1)
                    let tmpBool = j < (maxWidth - l) % (k - 1)
                    if tmpBool {
                        tmpLen += 1
                    }
                    let tmpArr: [Character] = Array(repeating: " ", count: tmpLen)
                    tmp += String(tmpArr)
                }
                tmp += words[i+j+1]
            }
            let charArrLen = maxWidth - tmp.characters.count
            let charArr: [Character] = Array(repeating: " ", count: charArrLen)
            tmp += String(charArr)
            res.append(tmp)
            i += k
        }
        return res
    }
}
