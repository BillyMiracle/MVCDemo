//
//  MyModel.m
//  MVCStudying
//
//  Created by 张博添 on 2021/9/6.
//

#import "MyModel.h"

@implementation MyModel

static MyModel *_instance = nil;

//作用：加载类
//程序一启动就分配空间
+ (void)load {
    _instance = [[self alloc] init];
    [_instance myModelInit];
}

+ (instancetype)getModel {
    return _instance;
}

+ (instancetype)alloc {
    if (_instance) {
        //不允许重复创建
        //创建一个异常
        NSException *excp = [NSException exceptionWithName:@"Error" reason:@"Error" userInfo:nil];
        //抛出异常
        [excp raise];
    }
    return [super alloc];
}

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
