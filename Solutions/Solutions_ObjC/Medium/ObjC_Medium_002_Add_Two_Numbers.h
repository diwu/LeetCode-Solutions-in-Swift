#import <Foundation/Foundation.h>

@interface ObjC_Medium_002_Add_Two_Numbers_Node : NSObject

@property (nonatomic, assign) NSInteger value;

@property (nonatomic, strong, nullable) ObjC_Medium_002_Add_Two_Numbers_Node *next;

- (nonnull instancetype)init: (NSInteger) value next: (nullable ObjC_Medium_002_Add_Two_Numbers_Node *)next NS_DESIGNATED_INITIALIZER;

@end

@interface ObjC_Medium_002_Add_Two_Numbers : NSObject

+ (nullable ObjC_Medium_002_Add_Two_Numbers_Node *)addNumbers: (nullable ObjC_Medium_002_Add_Two_Numbers_Node *)node1 node2: (nullable ObjC_Medium_002_Add_Two_Numbers_Node *)node2;

@end