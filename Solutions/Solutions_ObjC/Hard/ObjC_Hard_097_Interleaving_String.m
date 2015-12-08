/*
 
 https://leetcode.com/problems/interleaving-string/
 
 #97 Interleaving String
 
 Level: hard
 
 Given s1, s2, s3, find whether s3 is formed by the interleaving of s1 and s2.
 
 For example,
 Given:
 s1 = "aabcc",
 s2 = "dbbca",
 
 When s3 = "aadbbcbcac", return true.
 When s3 = "aadbbbaccc", return false.
 
 Inspired by @sherryxmhe at https://leetcode.com/discuss/11694/my-dp-solution-in-c
 
 */

#import "ObjC_Hard_097_Interleaving_String.h"

@implementation ObjC_Hard_097_Interleaving_String

// t = O(N*M), s = O(N*M)
+ (BOOL)isInterleaveWithS1: (NSString *)s1 s2: (NSString *)s2 s3: (NSString *)s3 {
    if (s1.length + s2.length != s3.length) {
        return false;
    }
    NSMutableArray<NSMutableArray<NSNumber *> *> *dp = [NSMutableArray arrayWithCapacity:s1.length];
    for (NSInteger i = 0; i < s1.length + 1; i++) {
        dp[i] = [NSMutableArray arrayWithCapacity:s2.length];
        for (NSInteger j = 0; j < s2.length + 1; j++) {
            [dp[i] addObject:@(false)];
        }
    }
    for (NSInteger i = 0; i < s1.length + 1; i++) {
        for (NSInteger j = 0; j < s2.length + 1; j++) {
            if (i == 0 && j == 0) {
                dp[i][j] = @(true);
            } else if (i == 0) {
                dp[0][j] = @([dp[0][j-1] boolValue] && ([s2 characterAtIndex:j-1] == [s3 characterAtIndex:j-1]));
            } else if (j == 0) {
                dp[i][0] = @([dp[i-1][0] boolValue] && ([s1 characterAtIndex:i-1] == [s3 characterAtIndex:i-1]));
            } else {
                dp[i][j] = @(([dp[i][j-1] boolValue] && ([s2 characterAtIndex:j-1] == [s3 characterAtIndex:i+j-1])) || ([dp[i-1][j] boolValue] && ([s1 characterAtIndex:i-1] == [s3 characterAtIndex:i+j-1])));
            }
        }
    }
    return [dp[s1.length][s2.length] boolValue];
}

@end
