/*

https://leetcode.com/problems/simplify-path/

#71 Simplify Path 

Level: medium

Given an absolute path for a file (Unix-style), simplify it.

For example,
path = "/home/", => "/home"
path = "/a/./b/../../c/", => "/c"

Corner Cases:
Did you consider the case where path = "/../"?
In this case, you should return "/".
Another corner case is the path might contain multiple slashes '/' together, such as "/home//foo/".
In this case, you should ignore redundant slashes and return "/home/foo".

Inspired by @monaziyi at https://leetcode.com/discuss/24939/c-10-lines-solution

*/

import Foundation

struct Medium_071_Simplify_Path {
    static func simplifyPath(path: String) -> String {
        var stack: [String] = []
        let arr = path.characters.split {$0 == "/"}.map(String.init)
                for (_, s) in arr.enumerate() {
            if s == "" || s == "." {
                continue
            } else if s == ".." && stack.isEmpty == false {
                stack.removeLast()
            } else if s != ".." {
                stack.append(s)
            }
        }
        var res = ""
        for (_, s) in stack.enumerate() {
            res += "/" + s
        }
        return res.isEmpty ? "/" : res
    }
}