//
//  RegisterViewController.m
//  MVCStudying
//
//  Created by 张博添 on 2021/9/9.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@property (nonatomic, strong) RegisterView *registerView;
@property (nonatomic, assign) NSInteger flag;


@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _registerView = [[RegisterView alloc] initWithFrame:self.view.frame];
    [_registerView.addButton addTarget:self action:@selector(pressAdd) forControlEvents:UIControlEventTouchUpInside];
    [_registerView.backButton addTarget:self action:@selector(pressBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerView];
}

- (void)pressAdd {
    if ([_registerView.myTextField.text isEqualToString:@""] || [_registerView.keyTextField.text isEqualToString:@""]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Top Tip" message:@"用户名或密码不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancel];
        [self presentViewController:alert animated:NO completion:nil];
    } else {
        _flag = 0;
        for (int i = 0; i < _nameArray.count; ++i) {
            if ([_registerView.myTextField.text isEqualToString:_nameArray[i]]) {
                _flag = 1;
            }
        }
        if (_flag == 0) {
            NSNotification *notification = [NSNotification notificationWithName:@"sendNameAndKey" object:nil userInfo:@{@"name":_registerView.myTextField.text, @"key":_registerView.keyTextField.text}];
            [[NSNotificationCenter defaultCenter] postNotification:notification];
            [self dismissViewControllerAnimated:NO completion:nil];
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Top Tip" message:@"用户名被使用" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:cancel];
            [self presentViewController:alert animated:NO completion:nil];
        }
    }
}

- (void)pressBack {
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
