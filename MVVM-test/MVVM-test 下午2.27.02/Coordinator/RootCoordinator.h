//
//  RootCoordinator.h
//  MVVM-test
//
//  Created by biostime on 2018/6/25.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coordinator.h"

@interface RootCoordinator : NSObject<Coordinator>

@property (nonatomic , strong) UINavigationController *navigationController;
@property (nonatomic , strong) UIWindow *window;

@property (nonatomic , strong)NSMutableArray *coordinators;


@end
