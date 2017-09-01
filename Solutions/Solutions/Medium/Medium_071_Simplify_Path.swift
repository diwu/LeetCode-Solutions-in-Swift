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
    static func simplifyPath(_ path: String) -> String {
        let arr = path.characters.split{ $0=="/" }.map(String.init)
        var stack = [String]()
        for s in arr {
            if s == "" || s == "." { continue }
            if s == ".." { _ = stack.popLast(); continue; }
            stack.append(s)
        }
        return stack.isEmpty ? "/" : "/" + stack.joined(separator:"/")
    }
}
