/*
 
 https://leetcode.com/problems/letter-combinations-of-a-phone-number/
 
 #17 Letter Combinations of a Phone Number
 
 Level: medium
 
 Given a digit string, return all possible letter combinations that the number could represent.
 
 A mapping of digit to letters (just like on the telephone buttons) is given below.
 
 2 -> abc
 3 -> def
 4 -> ghi
 5 -> jkl
 6 -> mno
 7 -> pqrs
 8 -> tuv
 9 -> wxyz
 
 Input:Digit string "23"
 Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 
 Note:
 Although the above answer is in lexicographical order, your answer could be in any order you want.
 
 Inspired by @lirensun at https://leetcode.com/discuss/24431/my-java-solution-with-fifo-queue
 
 */

#import "ObjC_Medium_017_Letter_Combinations_Of_A_Phone_Number.h"

@implementation ObjC_Medium_017_Letter_Combinations_Of_A_Phone_Number

+ (nonnull NSArray<NSString *> *)p_mapping {
    NSArray<NSString *> *mapping = @[
                                     @"0",
                                     @"1",
                                     @"abc",
                                     @"def",
                                     @"ghi",
                                     @"jkl",
                                     @"mno",
                                     @"pqrs",
                                     @"tuv",
                                     @"wxyz"
                                     ];
    return mapping;
}

// t = O(3^N), s = O(3^N)
+ (nonnull NSArray<NSString *> *)letterCombinations: (NSString *)s {
    NSArray<NSString *> *mapping = [self p_mapping];
    NSMutableArray<NSString *> *ans = [NSMutableArray arrayWithObject:@""];
    for (NSInteger i = 0; i < s.length; i++) {
        NSInteger integerValue = [[s substringWithRange:NSMakeRange(i, 1)] integerValue];
        while ([[ans firstObject] length] == i) {
            NSString *first = [ans firstObject];
            [ans removeObjectAtIndex:0];
            for (NSInteger j = 0; j < [mapping[integerValue] length]; j++) {
                [ans addObject:[NSString stringWithFormat:@"%@%@", first, [mapping[integerValue] substringWithRange:NSMakeRange(j, 1)]]];
            }
        }
    }
    return [ans copy];
}

@end
