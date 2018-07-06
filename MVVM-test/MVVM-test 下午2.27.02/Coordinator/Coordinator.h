//
//  Coordinator.h
//  FlickrSearchMVVMC
//
//  Created by niwanglong on 2018/5/9.
//  Copyright © 2018年 倪望龙. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol Coordinator <NSObject>
-(void)launch;

-(void)addCoordinator:(id)coordinator;
-(void)removeCoordinator:(id)coordinator;
@optional

@end
