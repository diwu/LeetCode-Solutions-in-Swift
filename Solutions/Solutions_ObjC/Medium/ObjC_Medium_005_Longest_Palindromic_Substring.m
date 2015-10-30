/*
 
 https://oj.leetcode.com/problems/longest-palindromic-substring/
 
 #5 Longest Palindromic Substring
 
 Level: medium
 
 Given a string S, find the longest palindromic substring in S. You may assume that the maximum length of S is 1000, and there exists one unique longest palindromic substring.
 
 Inspired by @hh1985 at https://leetcode.com/discuss/32204/simple-c-solution-8ms-13-lines
 
 */

#import "ObjC_Medium_005_Longest_Palindromic_Substring.h"

@implementation ObjC_Medium_005_Longest_Palindromic_Substring

// t = O(N^2), s = O(1)
+ (nonnull NSString *)longestPalindrome: (nonnull NSString *)s {
    if (s.length == 0) {
        return @"";
    } else if (s.length == 1)  {
        return s;
    } else {
        NSInteger min_start = 0;
        NSInteger max_len = 1;
        for (NSInteger i = 0; i < s.length; ) {
            if (s.length - i <= max_len/2) {
                break;
            }
            NSInteger j = i;
            NSInteger k = i;
            while (k < s.length - 1 && [s characterAtIndex:k+1] == [s characterAtIndex:k]) {
                k++;
            }
            i = k + 1;
            while (k < s.length - 1 && j > 0 && [s characterAtIndex:k+1] == [s characterAtIndex:j-1]) {
                k++;
                j--;
            }
            NSInteger new_len = k - j + 1;
            if (new_len > max_len) {
                max_len = new_len;
                min_start = j;
            }
        }
        return [s substringWithRange:NSMakeRange(min_start, max_len)];
    }
}

@end
