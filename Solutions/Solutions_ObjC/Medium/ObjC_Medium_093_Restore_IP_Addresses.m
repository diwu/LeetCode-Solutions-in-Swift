/*
 
 https://leetcode.com/problems/restore-ip-addresses/
 
 #93 Restore IP Addresses
 
 Level: medium
 
 Given a string containing only digits, restore it by returning all possible valid IP address combinations.
 
 For example:
 Given "25525511135",
 
 return ["255.255.11.135", "255.255.111.35"]. (Order does not matter)
 
 Inspired by @fiona_mao at https://leetcode.com/discuss/12790/my-code-in-java
 
 */

#import "ObjC_Medium_093_Restore_IP_Addresses.h"

@implementation ObjC_Medium_093_Restore_IP_Addresses

// t = O(1), s = O(1)
+ (nonnull NSArray<NSString *> *)restoreIpAddresses: (nonnull NSString *)s {
    NSMutableArray<NSString *> *res = [NSMutableArray new];
    NSInteger len = s.length;
    for (NSInteger i = 1; i < 4 && i < len - 2; i++) {
        for (NSInteger j = i + 1; j < i + 4 && j < len - 1; j++) {
            for (NSInteger k = j + 1; k < j + 4 && k < len; k++) {
                NSString *s0 = [s substringWithRange:NSMakeRange(0, i)];
                NSString *s1 = [s substringWithRange:NSMakeRange(i, j-i)];
                NSString *s2 = [s substringWithRange:NSMakeRange(j, k-j)];
                NSString *s3 = [s substringWithRange:NSMakeRange(k, len-k)];
                if ([self p_isValid:s0] && [self p_isValid:s1] && [self p_isValid:s2] && [self p_isValid:s3]) {
                    [res addObject:[NSString stringWithFormat:@"%@.%@.%@.%@", s0, s1, s2, s3]];
                }
            }
        }
    }
    return [res copy];
}

+ (BOOL)p_isValid: (nonnull NSString *)s {
    if (s.length == 0) {
        return NO;
    }
    if (s.length > 4) {
        return NO;
    }
    if ([s integerValue] > 255) {
        return NO;
    }
    if (s.length > 1 && [s characterAtIndex:0] == '0') {
        return NO;
    }
    return YES;
}

@end
