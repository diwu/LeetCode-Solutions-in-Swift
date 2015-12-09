#import <Foundation/Foundation.h>

@interface ObjC_Medium_098_Validate_Binary_Search_Tree_Node : NSObject

@property (nonatomic, assign) NSInteger value;

@property (nonatomic, strong, nullable) ObjC_Medium_098_Validate_Binary_Search_Tree_Node *left;

@property (nonatomic, strong, nullable) ObjC_Medium_098_Validate_Binary_Search_Tree_Node *right;

- (nonnull instancetype)initWithValue: (NSInteger) value left: (nullable ObjC_Medium_098_Validate_Binary_Search_Tree_Node *)left right: (nullable ObjC_Medium_098_Validate_Binary_Search_Tree_Node *) right NS_DESIGNATED_INITIALIZER;

@end

@interface ObjC_Medium_098_Validate_Binary_Search_Tree : NSObject

+ (BOOL)isValidBST: (nullable ObjC_Medium_098_Validate_Binary_Search_Tree_Node *)root;

@end
