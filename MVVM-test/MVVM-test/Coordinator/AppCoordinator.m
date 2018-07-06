//
//  AppCoordinator.m
//  MVVM-test
//
//  Created by biostime on 2018/6/25.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import "AppCoordinator.h"
#import "MainCoordinator.h"
#import "LoginCoordinator.h"

@interface AppCoordinator ()<MainCoordinatorDelegate,LoginCoordinatorDelegate>

@end
@implementation AppCoordinator

- (void)launch {
    BOOL isLogin=NO;
    
    if (isLogin) {
        [self rootViewController_mainVC];
    }
    else{
        [self rootViewController_loginVC];
    }
}

-(void)rootViewController_mainVC
{
    MainCoordinator *mCoordinator=[[MainCoordinator alloc]init];
    mCoordinator.delegate=self;
    [mCoordinator launch];
    [self addCoordinator:mCoordinator];
}


-(void)rootViewController_loginVC
{
    LoginCoordinator *loginCoordinator=[[LoginCoordinator alloc]init];
    loginCoordinator.delegate=self;
    [loginCoordinator launch];
    [self addCoordinator:loginCoordinator];
}

#pragma mark --- MainCoordinatorDelegate
- (void)pushToLoginVC:(id)viewModel
{
    [self rootViewController_loginVC];
}

#pragma mark --- LoginCoordinatorDelegate
- (void)pushToMainVC:(id)viewModel
{
    [self rootViewController_mainVC];
}

@end
