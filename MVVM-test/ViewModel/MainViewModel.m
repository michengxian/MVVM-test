//
//  MainViewModel.m
//  MVVM-test
//
//  Created by biostime on 2018/6/25.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import "MainViewModel.h"

@implementation MainViewModel


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

-(void)initialize
{
    [RACObserve(self, rowDidSelect) subscribeNext:^(id  _Nullable x) {
        [self.rowDidSelect subscribeNext:^(id  _Nullable x) {
            RACTuple *input=x;
            if ([self.delegate respondsToSelector:@selector(pushVC:)]) {
                [self.delegate pushVC:input.last];
            }
            [self exuteSelectSignal:input];
        }];
    }];
    
}

- (RACSignal *)exuteSelectSignal:(RACTuple *)idx{
    
    ///模拟数据返回后，需要刷新页面
    NSIndexPath *indexPath=idx.last;
//    if (indexPath.row!=3) {
        [self initDataWith:indexPath.row];
//    }
    
    
    return nil;
}

-(NSMutableArray<MainTableViewCellModel *> *)viewModelArray
{
    if (!_viewModelArray) {
        NSMutableArray *dataArray=[[NSMutableArray alloc]init];
        for (NSInteger i=0; i<20; i++) {
            MainTableViewCellModel *model=[[MainTableViewCellModel alloc]init];
            NSString *str=[NSString stringWithFormat:@"%ld",i];
            model.subTitle=str;
            model.height=80;
            [dataArray addObject:model];
        }
        
        _viewModelArray=dataArray;
    }
    return _viewModelArray;
}


-(void)initDataWith:(NSInteger)tmp
{
//    NSLog(@"数据加载完成");
    NSInteger i=0;
    for (MainTableViewCellModel *model in self.viewModelArray) {
        NSInteger count=i+tmp*10;
        NSString *str=[NSString stringWithFormat:@"%ld",count];
        model.subTitle=str;
        i++;
    }
}


@end
