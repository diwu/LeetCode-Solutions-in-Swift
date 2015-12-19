/*
 
 https://leetcode.com/problems/symmetric-tree/
 
 #101 Symmetric Tree
 
 Level: easy
 
 Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
 
 For example, this binary tree is symmetric:
 
     1
    / \
   2   2
  / \ / \
 3  4 4  3
 
 But the following is not:
 
     1
    / \
   2   2
    \   \
    3    3
 
 Inspired by [@xuanaux](https://leetcode.com/discuss/456/recusive-solution-symmetric-optimal-solution-inordertraversal)
 
 */

#import "ObjC_Easy_101_Symmetric_Tree.h"

@implementation ObjC_Easy_101_Symmetric_Tree_Node

- (instancetype)init {
    return [self initWithValue:1 left:nil right:nil];
}

- (instancetype)initWithValue:(NSInteger)value left:(ObjC_Easy_101_Symmetric_Tree_Node *)left right:(ObjC_Easy_101_Symmetric_Tree_Node *)right {
    if ((self = [super init])) {
        _value = value;
        _left = left;
        _right = right;
    }
    return self;
}

@end

@implementation ObjC_Easy_101_Symmetric_Tree

+ (void)p_addObjectHelper:(NSMutableArray *)stack node: (ObjC_Easy_101_Symmetric_Tree_Node *)node {
    if (node == nil) {
        [stack addObject:[NSNull null]];
    } else {
        [stack addObject:node];
    }
}

+ (BOOL)isSymmetric:(nullable ObjC_Easy_101_Symmetric_Tree_Node *)root {
    if (root == nil) {
        return true;
    }
    NSMutableArray *stack_1 = [NSMutableArray array];
    NSMutableArray *stack_2 = [NSMutableArray array];
    [stack_1 addObject:root];
    [stack_2 addObject:root];
    while (stack_1.count > 0 && stack_2.count > 0) {
        ObjC_Easy_101_Symmetric_Tree_Node *tmp_1 = [stack_1 lastObject];
        ObjC_Easy_101_Symmetric_Tree_Node *tmp_2 = [stack_2 lastObject];
        [stack_1 removeLastObject];
        [stack_2 removeLastObject];
        if ([tmp_1 isKindOfClass:[NSNull class]] && [tmp_2 isKindOfClass:[NSNull class]]) {
            continue;
        }
        if ([tmp_1 isKindOfClass:[NSNull class]] || [tmp_2 isKindOfClass:[NSNull class]]) {
            return false;
        }
        if (tmp_1.value != tmp_2.value) {
            return false;
        }
        [self p_addObjectHelper:stack_1 node:tmp_1.left];
        [self p_addObjectHelper:stack_2 node:tmp_2.right];
        [self p_addObjectHelper:stack_1 node:tmp_1.right];
        [self p_addObjectHelper:stack_2 node:tmp_2.left];
    }
    return true;
}

@end
