//
//  MainTableViewCell.m
//  MVVM-test
//
//  Created by biostime on 2018/6/25.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import "MainTableViewCell.h"
#import "MainTableViewCellModel.h"

@interface MainTableViewCell ()

@property (nonatomic , strong)MainTableViewCellModel *viewModel;

@property (nonatomic , assign) BOOL noObserver;

@end

@implementation MainTableViewCell

+ (instancetype)initTableViewCell:(UITableView *)tableVieW andCellIdentify:(NSString *)cellIdentify{
    MainTableViewCell *cell = [tableVieW dequeueReusableCellWithIdentifier:cellIdentify];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellIdentify owner:nil options:nil]lastObject];
    }//由于是从xib中创建，所以调用loadNibName的方法
    
    return cell;
}


-(void)awakeFromNib
{
    [super awakeFromNib];
    __block RACDisposable *disponable=[RACObserve(self, viewModel) subscribeNext:^(id  _Nullable x) {
        [[self.viewModel rac_valuesAndChangesForKeyPath:@"height" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) observer:self] subscribeNext:^(RACTwoTuple<id,NSDictionary *> * _Nullable x) {
            NSDictionary *dict=x.last;
            NSLog(@"new- %@",[dict objectForKey:@"new"]);
            NSLog(@"old- %@",[dict objectForKey:@"old"]);
        }];
        [disponable dispose];
    }];
    
    
    RAC(self.subTitle,text)=RACObserve(self.viewModel, subTitle);
    
    WeakSelf(self)
    __block RACDisposable *disponable1=[RACObserve(self, viewModel) subscribeNext:^(id  _Nullable x) {
        [RACObserve(self.viewModel,subTitle) subscribeNext:^(id  _Nullable x) {
            NSString *str=[NSString stringWithFormat:@"%@",x];
            weakself.subTitle.text=str;
        }];
        [disponable1 dispose];
    }];
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
}

- (void)bindViewModel:(id)viewModel
{

    MainTableViewCellModel *model=viewModel;
    self.viewModel=model;
    
    

    WeakSelf(self)
    __block RACDisposable *disponable=[RACObserve(model,subTitle) subscribeNext:^(id  _Nullable x) {
        NSString *str=[NSString stringWithFormat:@"%@",x];
        weakself.subTitle.text=str;
        [disponable dispose];
    }];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)dealloc
{
    NSLog(@"MainTableViewCell 销毁");
}

@end
