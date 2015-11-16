//
//  ObjC_Medium_094_Binary_Tree_Inorder_Traversal.m
//  Solutions
//
//  Created by Di Wu on 11/4/15.
//  Copyright © 2015 diwu. All rights reserved.
//

#import "ObjC_Medium_094_Binary_Tree_Inorder_Traversal.h"

@implementation ObjC_Medium_094_Binary_Tree_Inorder_Traversal_Node

- (instancetype)init {
    return [self initWithValue:0 left:nil right:nil];
}

- (nonnull instancetype)initWithValue: (NSInteger) value left: (nullable ObjC_Medium_094_Binary_Tree_Inorder_Traversal_Node *)left right: (nullable ObjC_Medium_094_Binary_Tree_Inorder_Traversal_Node *) right {
    if ((self = [super init])) {
        _value = value;
        _left = left;
        _right = right;
    }
    return self;
}

@end

@implementation ObjC_Medium_094_Binary_Tree_Inorder_Traversal

// Recursion, t = O(N), average s = O(log(N)), worst s = O(N)
+ (nonnull NSArray<NSNumber *> *)inorderTraversal_iteration:(ObjC_Medium_094_Binary_Tree_Inorder_Traversal_Node *)root {
    NSMutableArray *ret = [NSMutableArray array];
    NSMutableArray *stack = [NSMutableArray array];
    ObjC_Medium_094_Binary_Tree_Inorder_Traversal_Node *curr = root;
    while (curr != nil || [stack count] > 0) {
        while (curr != nil) {
            [stack addObject:curr];
            curr = curr.left;
        }
        ObjC_Medium_094_Binary_Tree_Inorder_Traversal_Node *last = [stack lastObject];
        [stack removeLastObject];
        [ret addObject:@(last.value)];
        curr = last.right;
    }
    return [ret copy];
}

+ (void)inorderTraversal_recursion_helperWithRoot:(ObjC_Medium_094_Binary_Tree_Inorder_Traversal_Node *)root arr: (nonnull NSMutableArray<NSNumber *> *)arr {
    if (root != nil) {
        [self inorderTraversal_recursion_helperWithRoot:root.left arr:arr];
        [arr addObject:@(root.value)];
        [self inorderTraversal_recursion_helperWithRoot:root.right arr:arr];
    }
}

// Recursion, t = O(N), average s = O(log(N)), worst s = O(N)
+ (nonnull NSArray<NSNumber *> *)inorderTraversal_recursion:(ObjC_Medium_094_Binary_Tree_Inorder_Traversal_Node *)root {
    NSMutableArray *arr = [NSMutableArray array];
    [self inorderTraversal_recursion_helperWithRoot:root arr:arr];
    return [arr copy];
}

+ (nonnull NSArray<NSNumber *> *)inorderTraversal: (nullable ObjC_Medium_094_Binary_Tree_Inorder_Traversal_Node *)root {
    return [self inorderTraversal_iteration:root];
//    return @[@(1)];
}

@end
