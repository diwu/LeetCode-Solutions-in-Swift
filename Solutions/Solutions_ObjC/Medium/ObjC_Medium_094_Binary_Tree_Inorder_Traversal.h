#import <Foundation/Foundation.h>

@interface ObjC_Medium_094_Binary_Tree_Inorder_Traversal_Node : NSObject

@property (nonatomic, assign) NSInteger value;

@property (nonatomic, strong, nullable) ObjC_Medium_094_Binary_Tree_Inorder_Traversal_Node *left;

@property (nonatomic, strong, nullable) ObjC_Medium_094_Binary_Tree_Inorder_Traversal_Node *right;

- (nonnull instancetype)initWithValue: (NSInteger) value left: (nullable ObjC_Medium_094_Binary_Tree_Inorder_Traversal_Node *)left right: (nullable ObjC_Medium_094_Binary_Tree_Inorder_Traversal_Node *) right NS_DESIGNATED_INITIALIZER;

@end

@interface ObjC_Medium_094_Binary_Tree_Inorder_Traversal : NSObject

+ (nonnull NSArray<NSNumber *> *)inorderTraversal: (nullable ObjC_Medium_094_Binary_Tree_Inorder_Traversal_Node *)root;

@end
