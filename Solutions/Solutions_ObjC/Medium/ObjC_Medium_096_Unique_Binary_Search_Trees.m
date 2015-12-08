/*
 
 https://leetcode.com/problems/unique-binary-search-trees/
 
 #96 Unique Binary Search Trees
 
 Level: medium
 
 Given n, how many structurally unique BST's (binary search trees) that store values 1...n?
 
 For example,
 Given n = 3, there are a total of 5 unique BST's.
 
 1         3     3      2      1
 \       /     /      / \      \
 3     2     1      1   3      2
 /     /       \                 \
 2     1         2                 3
 
 Inspired by @liaison at https://leetcode.com/discuss/24282/dp-solution-in-6-lines-with-explanation-f-i-n-g-i-1-g-n-i
 
 */

#import "ObjC_Medium_096_Unique_Binary_Search_Trees.h"

@implementation ObjC_Medium_096_Unique_Binary_Search_Trees

+ (NSInteger)numTrees: (NSInteger)n {
    if (n == 0 || n == 1) {
        return 1;
    }
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:n+1];
    for (NSInteger i = 0; i <= n; i++) {
        arr[i] = @(0);
    }
    arr[0] = @(1);
    arr[1] = @(1);
    for (NSInteger i = 2; i <= n; i++) {
        for (NSInteger j = 0; j < i; j++) {
            arr[i] = @([arr[i] integerValue] + [arr[j] integerValue] * [arr[i-1-j] integerValue]);
        }
    }
    return [arr[n] integerValue];
}

@end
