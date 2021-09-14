//
//  MyViewController.m
//  MVCStudying
//
//  Created by 张博添 on 2021/9/6.
//

#import "MyViewController.h"
#import "RegisterViewController.h"
#import "MyModel.h"
#import "MyView.h"

@interface MyViewController()

@property (nonatomic, assign) NSInteger flag;
@property (nonatomic, strong) MyView *myView;
@property (nonatomic, strong) MyModel *myModel;

@end

@implementation MyViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receive:) name:@"sendNameAndKey" object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _myView = [[MyView alloc] initWithFrame:self.view.frame];
    [_myView.myButton addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchUpInside];
    [_myView.addButton addTarget:self action:@selector(pressAdd) forControlEvents:UIControlEventTouchUpInside];
    
//    _myModel = [[MyModel alloc] init];
//    [_myModel myModelInit];
    _myModel = [MyModel getModel];
    
    [self.view addSubview:_myView];
}

- (void)pressLogin {
    _flag = 0;
    for (int i = 0; i < _myModel.keyStringArray.count; ++i) {
        if ([_myView.myTextField.text isEqualToString:_myModel.nameStringArray[i]] && [_myView.keyTextField.text isEqualToString:_myModel.keyStringArray[i]]) {
            _flag = 1;
        }
    }
    if (_flag == 1) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Top Tip" message:@"Correct" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:sure];
        [self presentViewController:alert animated:NO completion:nil];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Top Tip" message:@"Error" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancel];
        [self presentViewController:alert animated:NO completion:nil];
    }
}

- (void)pressAdd {
    RegisterViewController *registerPage = [[RegisterViewController alloc] init];
    registerPage.modalPresentationStyle = UIModalPresentationFullScreen;
//    registerPage.nameArray = [_myModel.nameStringArray mutableCopy];
//    registerPage.keyArray = [_myModel.keyStringArray mutableCopy];
    [self presentViewController:registerPage animated:NO completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_myView.myTextField resignFirstResponder];
}

- (void)receive:(NSNotification *)notification {
    NSDictionary *dict = notification.userInfo;
    _myView.myTextField.text = dict[@"name"];
    _myView.keyTextField.text = dict[@"key"];
    [_myModel myModelAddName:dict[@"name"] andKey:dict[@"key"]];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"sendNameAndKey" object:nil];
}

@end
