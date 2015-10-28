/*
 
 https://leetcode.com/discuss/25580/simple-java-solution-with-clear-explanation
 
 #92 Reverse Linked List II
 
 Level: medium
 
 Reverse a linked list from position m to n. Do it in-place and in one-pass.
 
 For example:
 Given 1->2->3->4->5->NULL, m = 2 and n = 4,
 
 return 1->4->3->2->5->NULL.
 
 Note:
 Given m, n satisfy the following condition:
 1 ≤ m ≤ n ≤ length of list.
 
 Inspired by @ardyadipta at https://leetcode.com/discuss/25580/simple-java-solution-with-clear-explanation
 
 */

#import "ObjC_Medium_092_Reverse_Linked_List_II.h"

@implementation ObjC_Medium_092_Reverse_Linked_List_II_Node

- (instancetype)init {
    return [self init:0 next:nil];
}

- (nonnull instancetype)init: (NSInteger) value next: (nullable ObjC_Medium_092_Reverse_Linked_List_II_Node *)next {
    if ((self = [super init])) {
        _value = value;
        _next = next;
    }
    return self;
}

@end

@implementation ObjC_Medium_092_Reverse_Linked_List_II

// t = O(N), s = O(1), one pass
+ (nullable ObjC_Medium_092_Reverse_Linked_List_II_Node *)reverseBetween: (nullable ObjC_Medium_092_Reverse_Linked_List_II_Node *)head m: (NSInteger)m n: (NSInteger)n {
    if (head == nil) {
        return nil;
    }
    ObjC_Medium_092_Reverse_Linked_List_II_Node *dummy = [ObjC_Medium_092_Reverse_Linked_List_II_Node new];
    dummy.next = head;
    ObjC_Medium_092_Reverse_Linked_List_II_Node *pre = dummy;
    for (NSInteger i = 0; i < m - 1; i++) {
        pre = pre.next;
    }
    ObjC_Medium_092_Reverse_Linked_List_II_Node *start = pre.next;
    ObjC_Medium_092_Reverse_Linked_List_II_Node *then = start.next;
    for (NSInteger i = 0; i < n - m; i++) {
        start.next = then.next;
        then.next = pre.next;
        pre.next = then;
        then = start.next;
    }
    return dummy.next;
}

@end
