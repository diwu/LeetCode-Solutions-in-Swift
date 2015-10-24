/*
 
 https://oj.leetcode.com/problems/two-sum/
 
 #1 Two Sum
 
 Level: medium
 
 Given an array of integers, find two numbers such that they add up to a specific target number.
 
 The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.
 
 You may assume that each input would have exactly one solution.
 
 Input: numbers={2, 7, 11, 15}, target=9
 Output: index1=1, index2=2
 
 Inspired by @naveed.zafar at https://leetcode.com/discuss/10947/accepted-c-o-n-solution
 
 */

#import <Foundation/Foundation.h>

@interface ObjC_Medium_001_Two_Sum : NSObject

+ (nonnull NSArray<NSNumber *> *)twoSum:(nonnull NSArray<NSNumber *> *)numbers target:(NSInteger)target;

@end
