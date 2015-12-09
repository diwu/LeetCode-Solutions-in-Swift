/*
 
 https://leetcode.com/problems/recover-binary-search-tree/
 
 #99 Recover Binary Search Tree
 
 Two elements of a binary search tree (BST) are swapped by mistake.
 
 Recover the tree without changing its structure.
 
 Note: A solution using O(n) space is pretty straight forward. Could you devise a constant space solution?
 
 Inspired by [@siyang3](https://leetcode.com/discuss/26310/detail-explain-about-morris-traversal-finds-incorrect-pointer)
 
 */

#import "ObjC_Hard_099_Recover_Binary_Search_Tree.h"

@implementation ObjC_Hard_099_Recover_Binary_Search_Tree_Node

- (instancetype)init {
    return [self initWithValue:1 left:nil right:nil];
}

- (nonnull instancetype)initWithValue: (NSInteger) value left: (nullable ObjC_Hard_099_Recover_Binary_Search_Tree_Node *)left right: (nullable ObjC_Hard_099_Recover_Binary_Search_Tree_Node *) right {
    if ((self = [super init])) {
        _value = value;
        _left = [left isKindOfClass:[ObjC_Hard_099_Recover_Binary_Search_Tree_Node class]] ? left : nil;
        _right = [right isKindOfClass:[ObjC_Hard_099_Recover_Binary_Search_Tree_Node class]] ? right : nil;
    }
    return self;
}

@end

@implementation ObjC_Hard_099_Recover_Binary_Search_Tree

// Morris, t = O(N), both average & worst s = O(1)
+ (nullable ObjC_Hard_099_Recover_Binary_Search_Tree_Node *)recoverTree: (nullable ObjC_Hard_099_Recover_Binary_Search_Tree_Node *)root {
    ObjC_Hard_099_Recover_Binary_Search_Tree_Node *origRoot = root;
    ObjC_Hard_099_Recover_Binary_Search_Tree_Node *prev = nil;
    ObjC_Hard_099_Recover_Binary_Search_Tree_Node *first = nil;
    ObjC_Hard_099_Recover_Binary_Search_Tree_Node *second = nil;
    ObjC_Hard_099_Recover_Binary_Search_Tree_Node *tmp = nil;
    while (root != nil) {
        if (root.left != nil) {
            tmp = root.left;
            while (tmp.right != nil && tmp.right != root) {
                tmp = tmp.right;
            }
            if (tmp.right != nil) {
                if (prev != nil && prev.value > root.value) {
                    if (first == nil) {
                        first = prev;
                        second = root;
                    } else {
                        second = root;
                    }
                }
                prev = root;
                tmp.right = nil;
                root = root.right;
            } else {
                tmp.right = root;
                root = root.left;
            }
        } else {
            if (prev != nil && prev.value > root.value) {
                if (first == nil) {
                    first = prev;
                    second = root;
                } else {
                    second = root;
                }
            }
            prev = root;
            root = root.right;
        }
    }
    if (first != nil && second != nil) {
        NSInteger tmpValue = first.value;
        first.value = second.value;
        second.value = tmpValue;
    }
    return origRoot;
}

@end
