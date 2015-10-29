/*
 
 https://leetcode.com/problems/median-of-two-sorted-arrays/
 
 #4 Median of Two Sorted Arrays
 
 Level: hard
 
 There are two sorted arrays A and B of size m and n respectively. Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 
 Inspired by @MissMary at https://leetcode.com/discuss/15790/share-my-o-log-min-m-n-solution-with-explanation
 
 */

#import "ObjC_Hard_004_Median_Of_Two_Sorted_Arrays.h"

@implementation ObjC_Hard_004_Median_Of_Two_Sorted_Arrays

+ (double)findMedianSortedArrays: (NSArray<NSNumber *> *)a b: (NSArray<NSNumber *> *) b {
    NSInteger m = a.count;
    NSInteger n = b.count;
    if (m > n) {
        return [self findMedianSortedArrays:b b:a];
    }
    NSInteger i_min = 0;
    NSInteger i_max = m;
    while (i_min <= i_max) {
        NSInteger i = i_min;
        NSInteger j = ((m + n + 1) >> 1) - i;
        if (j > 0 && i < m && [b[j-1] integerValue] > [a[i] integerValue]) {
            i_min = i + 1;
        } else if (i > 0 && j < n && [a[i-1] integerValue] > [b[j] integerValue]) {
            i_max = i - 1;
        } else {
            NSInteger num1;
            if (i == 0) {
                num1 = [b[j-1] integerValue];
            } else if (j == 0) {
                num1 = [a[i-1] integerValue];
            } else {
                num1 = MAX([a[i-1] integerValue], [b[j-1] integerValue]);
            }
            if ((m+n & 1) != 0) {
                return num1;
            }
            NSInteger num2;
            if (i >= m) {
                num2 = [b[j] integerValue];
            } else if (j >= n) {
                num2 = [a[i] integerValue];
            } else {
                num2 = MIN([a[i] integerValue], [b[j] integerValue]);
            }
            return ((double)num1+num2) / 2.0;
        }
    }
    return 0;
}

@end
