/*
 
 https://leetcode.com/problems/unique-binary-search-trees-ii/
 
 #95 Unique Binary Search Trees II
 
 Level: medium
 
 Given n, generate all structurally unique BST's (binary search trees) that store values 1...n.
 
 For example,
 Given n = 3, your program should return all 5 unique BST's shown below.
 
 1         3     3      2      1
 \       /     /      / \      \
 3     2     1      1   3      2
 /     /       \                 \
 2     1         2                 3
 
 Inspired by @Jayanta at https://leetcode.com/discuss/10254/a-simple-recursive-solution
 
 */

#import "ObjC_Medium_095_Unique_Binary_Search_Trees_II.h"

@implementation ObjC_Medium_095_Unique_Binary_Search_Trees_II_Node

- (instancetype)init {
    return [self initWithValue:1 left:nil right:nil];
}

- (nonnull instancetype)initWithValue: (NSInteger) value left: (nullable ObjC_Medium_095_Unique_Binary_Search_Trees_II_Node *)left right: (nullable ObjC_Medium_095_Unique_Binary_Search_Trees_II_Node *) right {
    if ((self = [super init])) {
        _value = value;
        _left = [left isKindOfClass:[ObjC_Medium_095_Unique_Binary_Search_Trees_II_Node class]] ? left : nil;
        _right = [right isKindOfClass:[ObjC_Medium_095_Unique_Binary_Search_Trees_II_Node class]] ? right : nil;
    }
    return self;
}

@end

@implementation ObjC_Medium_095_Unique_Binary_Search_Trees_II

+ (nonnull NSArray *)genTreesWithStart: (NSInteger)start end: (NSInteger)end {
    if (start > end) {
        return @[[NSNull null]];
    } else if (start == end) {
        return @[[ObjC_Medium_095_Unique_Binary_Search_Trees_II_Node new]];
    } else {
        NSMutableArray *ret = [NSMutableArray array];
        NSArray *left;
        NSArray *right;
        for (NSInteger i = start; i <= end; i++) {
            left = [self genTreesWithStart:start end:i-1];
            right = [self genTreesWithStart:i+1 end:end];
            for (NSInteger j = 0; j < left.count; j++) {
                for (NSInteger k = 0; k < right.count; k++) {
                    ObjC_Medium_095_Unique_Binary_Search_Trees_II_Node *node = [[ObjC_Medium_095_Unique_Binary_Search_Trees_II_Node alloc] initWithValue:1 left:left[j] right:right[k]];
                    [ret addObject:node];
                }
            }
        }
        return [ret copy];
    }
}

// t = O(n^(n-1)) a.k.a Catalan Number, s = I've no idea
+ (nonnull NSArray<ObjC_Medium_095_Unique_Binary_Search_Trees_II_Node *> *)generateTrees:(NSInteger) n {
    return [self genTreesWithStart:1 end:n];
}

@end
