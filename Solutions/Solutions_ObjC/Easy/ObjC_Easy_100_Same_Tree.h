#import <Foundation/Foundation.h>

@interface ObjC_Easy_100_Same_Tree_Node : NSObject

@property (nonatomic, assign) NSInteger value;

@property (nonatomic, strong, nullable) ObjC_Easy_100_Same_Tree_Node *left;

@property (nonatomic, strong, nullable) ObjC_Easy_100_Same_Tree_Node *right;

- (nonnull instancetype)initWithValue: (NSInteger) value left: (nullable ObjC_Easy_100_Same_Tree_Node *)left right: (nullable ObjC_Easy_100_Same_Tree_Node *) right NS_DESIGNATED_INITIALIZER;

@end

@interface ObjC_Easy_100_Same_Tree : NSObject

+ (BOOL)isSameTreeWithP: (nullable ObjC_Easy_100_Same_Tree_Node *)p q: (nullable ObjC_Easy_100_Same_Tree_Node *)q;

@end
