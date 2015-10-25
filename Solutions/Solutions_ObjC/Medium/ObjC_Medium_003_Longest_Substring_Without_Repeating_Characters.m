/*
 
 https://oj.leetcode.com/problems/longest-substring-without-repeating-characters/
 
 #3 Longest Substring Without Repeating Characters
 
 Level: medium
 
 Given a string, find the length of the longest substring without repeating characters. For example, the longest substring without repeating letters for "abcabcbb" is "abc", which the length is 3. For "bbbbb" the longest substring is "b", with the length of 1.
 
 Inspired by @heiyanbin at https://oj.leetcode.com/discuss/6168/my-o-n-solution
 
 */

#import "ObjC_Medium_003_Longest_Substring_Without_Repeating_Characters.h"

@implementation ObjC_Medium_003_Longest_Substring_Without_Repeating_Characters

+ (NSInteger)longest: (nonnull NSString *)s {
    NSInteger len = s.length;
    if (len < 2) {
        return len;
    } else {
        NSInteger tmpMaxLen = 1;
        NSInteger maxLen = 1;
        NSMutableDictionary<NSNumber *, NSNumber *> *hashMap = [NSMutableDictionary new];
        hashMap[@([s characterAtIndex:0])] = @(0);
        for (NSInteger i = 1; i < len; i++) {
            if (hashMap[@([s characterAtIndex:i])] != nil) {
                NSInteger lastPosition = [hashMap[@([s characterAtIndex:i])] integerValue];
                if (lastPosition + tmpMaxLen < i) {
                    tmpMaxLen++;
                } else {
                    tmpMaxLen = i - lastPosition;
                }
            } else {
                tmpMaxLen++;
            }
            hashMap[@([s characterAtIndex:i])] = @(i);
            if (tmpMaxLen > maxLen) {
                maxLen = tmpMaxLen;
            }
        }
        return maxLen;
    }
}

@end
