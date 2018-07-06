//
//  RootCoordinator.m
//  MVVM-test
//
//  Created by biostime on 2018/6/25.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import "RootCoordinator.h"
#import "AppDelegate.h"

@interface RootCoordinator ()


@end

@implementation RootCoordinator

-(UINavigationController *)navigationController
{
    if (!_navigationController) {
        _navigationController=[[UINavigationController alloc]init];
    }
    return _navigationController;
}

-(UIWindow *)window
{
    if (!_window) {
        AppDelegate *delegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
        _window=delegate.window;
    }
    return _window;
}

-(NSMutableArray *)coordinators
{
    if (!_coordinators) {
        _coordinators=[[NSMutableArray alloc]init];
    }
    return _coordinators;
}

-(void)launch
{
    
}

-(void)addCoordinator:(id)coordinator
{
    for (RootCoordinator *coor in self.coordinators) {
        if ([coordinator isKindOfClass:coor.class]) {
            [self removeCoordinator:coor];
            break;
        }
    }
    [self.coordinators addObject:coordinator];
}

-(void)removeCoordinator:(id)coordinator
{
    if ([self.coordinators containsObject:coordinator]) {
        [self.coordinators removeObject:coordinator];
    }
}

@end
