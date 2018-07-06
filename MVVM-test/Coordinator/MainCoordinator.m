//
//  MainCoordinator.m
//  MVVM-test
//
//  Created by biostime on 2018/6/25.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import "MainCoordinator.h"
#import "MainViewController.h"
#import "MainViewModel.h"
#import "FirstViewController.h"
#import "FirstViewModel.h"
#import "SencondViewController.h"
#import "LoginViewController.h"
@interface MainCoordinator ()<MainViewModelDelegate>

@end

@implementation MainCoordinator

- (void)launch {
//    NSLog(@"MainCoordinator-launch");
    MainViewModel *viewModel=[[MainViewModel alloc]init];
    MainViewController *mVC=[[MainViewController alloc]init];
    mVC.viewModel=viewModel;
    viewModel.delegate=self;
    viewModel.test=@"123456";
    
    self.navigationController.viewControllers=@[mVC];
    self.window.rootViewController=self.navigationController;
    [self.window makeKeyWindow];
}

-(void)pushToFirstVC:(MainTableViewCellModel *)mViewModel
{
    FirstViewModel *viewModel=[[FirstViewModel alloc]init];
    viewModel.test=viewModel.test;
    
    FirstViewController *firstVC=[[FirstViewController alloc]init];
    firstVC.viewModel=viewModel;
    [self.navigationController pushViewController:firstVC animated:YES];
}

-(void)pushToSecondVC:(MainTableViewCellModel *)mViewModel
{
//    FirstViewModel *viewModel=[[FirstViewModel alloc]init];
//    viewModel.test=viewModel.test;
    
    SencondViewController *firstVC=[[SencondViewController alloc]init];
//    firstVC.viewModel=viewModel;
    [self.navigationController pushViewController:firstVC animated:YES];
}

-(void)pushToLoginVC:(MainTableViewCellModel *)mViewModel
{
    if ([self.delegate respondsToSelector:@selector(pushToLoginVC:)]) {
        [self.delegate pushToLoginVC:nil];
    }
}

-(void)pushVC:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        [self pushToFirstVC:nil];
    }
    else if (indexPath.row==1){
        [self pushToSecondVC:nil];
    }
    else if (indexPath.row==4){
        [self pushToLoginVC:nil];
    }
}

@end
