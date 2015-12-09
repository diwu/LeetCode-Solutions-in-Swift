/*
 
 https://leetcode.com/problems/validate-binary-search-tree/
 
 #98 Validate Binary Search Tree
 
 Given a binary tree, determine if it is a valid binary search tree (BST).
 
 Assume a BST is defined as follows:
 
 The left subtree of a node contains only nodes with keys less than the node's key. The right subtree of a node contains only nodes with keys greater than the node's key. Both the left and right subtrees must also be binary search trees.
 
 Inspired by [@jakwings](https://leetcode.com/discuss/14886/order-traversal-please-rely-buggy-int_max-int_min-solutions)
 
 */

#import "ObjC_Medium_098_Validate_Binary_Search_Tree.h"

@implementation ObjC_Medium_098_Validate_Binary_Search_Tree_Node

- (instancetype)init {
    return [self initWithValue:1 left:nil right:nil];
}

- (nonnull instancetype)initWithValue: (NSInteger) value left: (nullable ObjC_Medium_098_Validate_Binary_Search_Tree_Node *)left right: (nullable ObjC_Medium_098_Validate_Binary_Search_Tree_Node *) right {
    if ((self = [super init])) {
        _value = value;
        _left = [left isKindOfClass:[ObjC_Medium_098_Validate_Binary_Search_Tree_Node class]] ? left : nil;
        _right = [right isKindOfClass:[ObjC_Medium_098_Validate_Binary_Search_Tree_Node class]] ? right : nil;
    }
    return self;
}

@end

@implementation ObjC_Medium_098_Validate_Binary_Search_Tree

+ (BOOL)isValidBSTRecursionHelper: (ObjC_Medium_098_Validate_Binary_Search_Tree_Node *)curr prev: (ObjC_Medium_098_Validate_Binary_Search_Tree_Node * __autoreleasing *)prev {
    if (curr == nil) {
        return true;
    } else {
        if ([self isValidBSTRecursionHelper:curr.left prev:prev] == false) {
            return false;
        }
        if ((*prev) != nil && (*prev).value > curr.value) {
            return false;
        }
        *prev = curr;
        return [self isValidBSTRecursionHelper:curr.right prev:prev];
    }
}

// t = O(N), average s = O(logN), worst s = O(N)
+ (BOOL)isValidBST: (nullable ObjC_Medium_098_Validate_Binary_Search_Tree_Node *)root {
    ObjC_Medium_098_Validate_Binary_Search_Tree_Node *prev;
    return [self isValidBSTRecursionHelper:root prev:&prev];
}

@end
