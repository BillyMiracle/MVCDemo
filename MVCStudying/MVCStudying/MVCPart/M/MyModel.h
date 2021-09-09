//
//  MyModel.h
//  MVCStudying
//
//  Created by 张博添 on 2021/9/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyModel : NSObject

@property (nonatomic, strong) NSMutableArray *nameStringArray;
@property (nonatomic, strong) NSMutableArray *keyStringArray;

- (void)myModelInit;
- (void)myModelAddName:(NSString *)addName andKey:(NSString *)addkey;

@end

NS_ASSUME_NONNULL_END
