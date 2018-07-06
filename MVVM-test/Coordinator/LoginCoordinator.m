//
//  LoginCoordinator.m
//  MVVM-test
//
//  Created by biostime on 2018/6/28.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import "LoginCoordinator.h"
#import "LoginViewModel.h"
#import "LoginViewController.h"
#import "MainViewController.h"

@interface LoginCoordinator()<LoginViewModelDelegate>


@end


@implementation LoginCoordinator

-(void)launch
{
    LoginViewController *loginVC=[[LoginViewController alloc]init];
    LoginViewModel *viewModel=[[LoginViewModel alloc]init];
    viewModel.delegate=self;
    loginVC.viewModel=viewModel;
    self.navigationController.viewControllers=@[loginVC];
    self.window.rootViewController=self.navigationController;
    [self.window makeKeyWindow];
}

- (void)loginVC:(id)viewModel
{
    if ([self.delegate respondsToSelector:@selector(pushToMainVC:)]) {
        [self.delegate pushToMainVC:viewModel];
    }
//    MainViewModel *mViewModel=[[MainViewModel alloc]init];
//    MainViewController *mVC=[[MainViewController alloc]init];
//    mVC.viewModel=mViewModel;
//    mViewModel.test=@"123456";
//    [self.navigationController pushViewController:mVC animated:YES];
}

@end
