#import <Foundation/Foundation.h>

@interface ObjC_Hard_099_Recover_Binary_Search_Tree_Node : NSObject

@property (nonatomic, assign) NSInteger value;

@property (nonatomic, strong, nullable) ObjC_Hard_099_Recover_Binary_Search_Tree_Node *left;

@property (nonatomic, strong, nullable) ObjC_Hard_099_Recover_Binary_Search_Tree_Node *right;

- (nonnull instancetype)initWithValue: (NSInteger) value left: (nullable ObjC_Hard_099_Recover_Binary_Search_Tree_Node *)left right: (nullable ObjC_Hard_099_Recover_Binary_Search_Tree_Node *) right NS_DESIGNATED_INITIALIZER;

@end

@interface ObjC_Hard_099_Recover_Binary_Search_Tree : NSObject

+ (nullable ObjC_Hard_099_Recover_Binary_Search_Tree_Node *)recoverTree: (nullable ObjC_Hard_099_Recover_Binary_Search_Tree_Node *)root;

@end
