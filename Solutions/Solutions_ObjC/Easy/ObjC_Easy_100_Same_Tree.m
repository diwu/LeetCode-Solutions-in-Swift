/*
 
 https://leetcode.com/problems/same-tree/
 
 #100 Same Tree
 
 Level: easy
 
 Given two binary trees, write a function to check if they are equal or not.
 
 Two binary trees are considered equal if they are structurally identical and the nodes have the same value.
 
 Inspired by [@JohnWeiGitHub](https://leetcode.com/discuss/3470/seeking-for-better-solution) and [@scott](https://leetcode.com/discuss/22197/my-non-recursive-method)
 
 */

#import "ObjC_Easy_100_Same_Tree.h"

@implementation ObjC_Easy_100_Same_Tree_Node

- (instancetype)init {
    return [self initWithValue:1 left:nil right:nil];
}

- (instancetype)initWithValue:(NSInteger)value left:(ObjC_Easy_100_Same_Tree_Node *)left right:(ObjC_Easy_100_Same_Tree_Node *)right {
    if ((self = [super init])) {
        _value = value;
        _left = left;
        _right = right;
    }
    return self;
}

@end

@implementation ObjC_Easy_100_Same_Tree

// t = O(N), average s = O(logN), worst s = O(N)
+ (BOOL)isSameTreeWithP_recursion:(ObjC_Easy_100_Same_Tree_Node *)p q:(ObjC_Easy_100_Same_Tree_Node *)q {
    if (p == nil || q == nil) {
        return (p == nil && q == nil);
    } else {
        return p.value == q.value && [self isSameTreeWithP_recursion:p.left q:q.left] && [self isSameTreeWithP_recursion:p.right q:q.right];
    }
}

// t = O(N), average s = O(logN), worst s = O(N)
+ (BOOL)isSameTreeWithP_iteration:(ObjC_Easy_100_Same_Tree_Node *)p q:(ObjC_Easy_100_Same_Tree_Node *)q {
    if (p == nil || q == nil) {
        return (p == nil && q == nil);
    } else {
        NSMutableArray *stack_p = [NSMutableArray arrayWithObject:p];
        NSMutableArray *stack_q = [NSMutableArray arrayWithObject:q];
        while (stack_p.count != 0 && stack_q.count != 0) {
            ObjC_Easy_100_Same_Tree_Node *tmp_p = stack_p[0];
            [stack_p removeObjectAtIndex:0];
            ObjC_Easy_100_Same_Tree_Node *tmp_q = stack_q[0];
            [stack_q removeObjectAtIndex:0];
            if (tmp_p.value != tmp_q.value) {
                return false;
            }
            if (tmp_p.left != nil) {
                [stack_p addObject:tmp_p.left];
            }
            if (tmp_q.left != nil) {
                [stack_q addObject:tmp_q.left];
            }
            if (stack_p.count != stack_q.count) {
                return false;
            }
            if (tmp_p.right != nil) {
                [stack_p addObject:tmp_p.right];
            }
            if (tmp_q.right != nil) {
                [stack_q addObject:tmp_q.right];
            }
            if (stack_p.count != stack_q.count) {
                return false;
            }
        }
        return stack_q.count == stack_q.count;
    }
}

+ (BOOL)isSameTreeWithP: (nullable ObjC_Easy_100_Same_Tree_Node *)p q: (nullable ObjC_Easy_100_Same_Tree_Node *)q {
    return [self isSameTreeWithP_iteration:p q:q];
}

@end
