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

+ (nonnull NSArray<NSNumber *> *)inorderTraversal: (nullable ObjC_Medium_094_Binary_Tree_Inorder_Traversal_Node *)root {
    return @[];
}

@end
