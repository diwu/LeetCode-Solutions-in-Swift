#import <Foundation/Foundation.h>

@interface ObjC_Easy_101_Symmetric_Tree_Node : NSObject

@property (nonatomic, assign) NSInteger value;

@property (nonatomic, strong, nullable) ObjC_Easy_101_Symmetric_Tree_Node *left;

@property (nonatomic, strong, nullable) ObjC_Easy_101_Symmetric_Tree_Node *right;

- (nonnull instancetype)initWithValue: (NSInteger) value left: (nullable ObjC_Easy_101_Symmetric_Tree_Node *)left right: (nullable ObjC_Easy_101_Symmetric_Tree_Node *) right NS_DESIGNATED_INITIALIZER;

@end

@interface ObjC_Easy_101_Symmetric_Tree : NSObject

+ (BOOL)isSymmetric:(nullable ObjC_Easy_101_Symmetric_Tree_Node *)root;

@end
