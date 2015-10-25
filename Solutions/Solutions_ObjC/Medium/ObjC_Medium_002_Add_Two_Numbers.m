/*
 
 https://oj.leetcode.com/problems/add-two-numbers/
 
 #2 Add Two Numbers
 
 Level: medium
 
 You are given two linked lists representing two non-negative numbers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 
 Inspired by @potpie at https://oj.leetcode.com/discuss/2308/is-this-algorithm-optimal-or-what
 
 */

#import "ObjC_Medium_002_Add_Two_Numbers.h"

@implementation ObjC_Medium_002_Add_Two_Numbers_Node

- (instancetype)init {
    return [self init:0 next:nil];
}

- (nonnull instancetype)init: (NSInteger) value next: (nullable ObjC_Medium_002_Add_Two_Numbers_Node *)next {
    if ((self = [super init])) {
        _value = value;
        _next = next;
    }
    return self;
}

@end

@implementation ObjC_Medium_002_Add_Two_Numbers

// t = O(N), s = O(1)
+ (nullable ObjC_Medium_002_Add_Two_Numbers_Node *)addNumbers: (nullable ObjC_Medium_002_Add_Two_Numbers_Node *)node1 node2: (nullable ObjC_Medium_002_Add_Two_Numbers_Node *)node2 {
    ObjC_Medium_002_Add_Two_Numbers_Node *tmp1 = node1;
    ObjC_Medium_002_Add_Two_Numbers_Node *tmp2 = node2;
    ObjC_Medium_002_Add_Two_Numbers_Node *dummy = [ObjC_Medium_002_Add_Two_Numbers_Node new];
    ObjC_Medium_002_Add_Two_Numbers_Node *curr = dummy;
    NSInteger sum = 0;
    while (tmp1 != nil || tmp2 != nil) {
        sum /= 10;
        if (tmp1 != nil) {
            sum += tmp1.value;
            tmp1 = tmp1.next;
        }
        if (tmp2 != nil) {
            sum += tmp2.value;
            tmp2 = tmp2.next;
        }
        curr.next = [[ObjC_Medium_002_Add_Two_Numbers_Node alloc] init:sum%10 next:nil];
        if (curr.next != nil) {
            curr = curr.next;
        }
    }
    if (sum / 10 == 1) {
        curr.next = [[ObjC_Medium_002_Add_Two_Numbers_Node alloc] init:1 next:nil];
    }
    return dummy.next;
}

@end
