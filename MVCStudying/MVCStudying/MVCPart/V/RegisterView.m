//
//  RegisterView.m
//  MVCStudying
//
//  Created by 张博添 on 2021/9/9.
//

#import "RegisterView.h"

#define selfWeidth self.bounds.size.width
#define selfHeight self.bounds.size.height

@implementation RegisterView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor lightGrayColor];
    
    _myTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 200, selfWeidth - 100, 50)];
    _myTextField.placeholder = @"name";
    _myTextField.backgroundColor = [UIColor whiteColor];
    [self addSubview:_myTextField];
    
    _keyTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 300, selfWeidth - 100, 50)];
    _keyTextField.placeholder = @"key";
    _keyTextField.backgroundColor = [UIColor whiteColor];
    [self addSubview:_keyTextField];
    
    _addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _addButton.frame = CGRectMake(100, 390, selfWeidth - 200, 50);
    [_addButton setTitle:@"注册" forState:UIControlStateNormal];
    [_addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _addButton.backgroundColor = [UIColor whiteColor];
    [self addSubview:_addButton];
    
    _backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _backButton.frame = CGRectMake(100, 480, selfWeidth - 200, 50);
    [_backButton setTitle:@"返回" forState:UIControlStateNormal];
    [_backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _backButton.backgroundColor = [UIColor whiteColor];
    [self addSubview:_backButton];
    
    return self;
}

@end
