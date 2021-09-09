//
//  MyModel.m
//  MVCStudying
//
//  Created by 张博添 on 2021/9/6.
//

#import "MyModel.h"

@implementation MyModel
- (void)myModelInit {
    _nameStringArray = [[NSMutableArray alloc] init];
    
    _keyStringArray = [[NSMutableArray alloc] init];
    
    [_nameStringArray addObject:@"nameFirst"];
    [_keyStringArray addObject:@"keyFirst"];
}

- (void)myModelAddName:(NSString *)addName andKey:(NSString *)addkey {
    [_keyStringArray addObject:addkey];
    [_nameStringArray addObject:addName];
}
@end
