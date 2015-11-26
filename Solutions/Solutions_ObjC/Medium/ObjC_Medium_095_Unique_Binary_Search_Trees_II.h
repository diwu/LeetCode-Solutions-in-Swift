#import <Foundation/Foundation.h>

@interface ObjC_Medium_095_Unique_Binary_Search_Trees_II_Node : NSObject

@property (nonatomic, assign) NSInteger value;

@property (nonatomic, strong, nullable) ObjC_Medium_095_Unique_Binary_Search_Trees_II_Node *left;

@property (nonatomic, strong, nullable) ObjC_Medium_095_Unique_Binary_Search_Trees_II_Node *right;

- (nonnull instancetype)initWithValue: (NSInteger) value left: (nullable ObjC_Medium_095_Unique_Binary_Search_Trees_II_Node *)left right: (nullable ObjC_Medium_095_Unique_Binary_Search_Trees_II_Node *) right NS_DESIGNATED_INITIALIZER;

@end

@interface ObjC_Medium_095_Unique_Binary_Search_Trees_II : NSObject

+ (nonnull NSArray<ObjC_Medium_095_Unique_Binary_Search_Trees_II_Node *> *)generateTrees:(NSInteger) n;

@end
