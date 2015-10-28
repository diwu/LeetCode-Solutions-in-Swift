#import <Foundation/Foundation.h>

@interface ObjC_Medium_092_Reverse_Linked_List_II_Node : NSObject

@property (nonatomic, assign) NSInteger value;

@property (nonatomic, strong, nullable) ObjC_Medium_092_Reverse_Linked_List_II_Node *next;

- (nonnull instancetype)init: (NSInteger) value next: (nullable ObjC_Medium_092_Reverse_Linked_List_II_Node *)next NS_DESIGNATED_INITIALIZER;

@end

@interface ObjC_Medium_092_Reverse_Linked_List_II : NSObject

+ (nullable ObjC_Medium_092_Reverse_Linked_List_II_Node *)reverseBetween: (nullable ObjC_Medium_092_Reverse_Linked_List_II_Node *)head m: (NSInteger)m n: (NSInteger)n;

@end
