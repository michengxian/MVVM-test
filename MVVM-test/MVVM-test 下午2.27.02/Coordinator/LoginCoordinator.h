//
//  LoginCoordinator.h
//  MVVM-test
//
//  Created by biostime on 2018/6/28.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import "RootCoordinator.h"

@protocol LoginCoordinatorDelegate<NSObject>

-(void)pushToMainVC:(id)viewModel;

@end

@interface LoginCoordinator : RootCoordinator

@property (nonatomic , weak) id<LoginCoordinatorDelegate> delegate;

@end
