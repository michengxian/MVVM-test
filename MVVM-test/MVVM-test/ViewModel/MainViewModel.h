//
//  MainViewModel.h
//  MVVM-test
//
//  Created by biostime on 2018/6/25.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainTableViewCellModel.h"

@protocol MainViewModelDelegate <NSObject>
-(void)pushVC:(NSIndexPath *)indexPath;
@end

@interface MainViewModel : NSObject

@property (nonatomic , strong) NSMutableArray<MainTableViewCellModel *> *viewModelArray;

@property (nonatomic , strong) RACSignal *rowDidSelect;

@property (nonatomic , weak) id <MainViewModelDelegate>delegate;

@property (nonatomic , strong) NSString *test;

@end
