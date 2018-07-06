//
//  MainCoordinator.h
//  MVVM-test
//
//  Created by biostime on 2018/6/25.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import "RootCoordinator.h"

@protocol MainCoordinatorDelegate<NSObject>

-(void)pushToLoginVC:(id)viewModel;

@end

@interface MainCoordinator : RootCoordinator

@property (nonatomic , weak) id<MainCoordinatorDelegate> delegate;

@end
