//
//  LoginViewController.m
//  MVVM-test
//
//  Created by biostime on 2018/6/28.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accoundTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"LoginViewController");

    self.loginButton.rac_command=self.viewModel.loginCommand;
//    self.viewModel.loginSignal=[self.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside];
    
    [self.accoundTextField.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        self.viewModel.account=x;
    }];
    [self.passwordTextField.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        self.viewModel.password=x;
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
