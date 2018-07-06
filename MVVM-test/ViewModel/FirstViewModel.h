//
//  FirstViewModel.h
//  MVVM-test
//
//  Created by biostime on 2018/6/25.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainTableViewCellModel.h"

@interface FirstViewModel : NSObject

@property (nonatomic , strong) NSString *test;
@property (nonatomic , strong) MainTableViewCellModel *model;

@end
