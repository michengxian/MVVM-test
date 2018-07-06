//
//  MainViewController.m
//  MVVM-test
//
//  Created by biostime on 2018/6/25.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import "MainViewController.h"
#import "MainTableViewCell.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic , strong)UITableView *mainTableView;

@property (nonatomic , assign) BOOL change;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"MainViewController");
    
    self.change=NO;
    
    self.mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.mainTableView.delegate=self;
    self.mainTableView.dataSource=self;
    [self.view addSubview:self.mainTableView];
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(0);
    }];

    
//    [RACObserve(self.viewModel, viewModelArray) subscribeNext:^(id  _Nullable x) {
//        [self.mainTableView reloadData];
//    }];
    
    WeakSelf(self)
    self.viewModel.rowDidSelect=[self rac_signalForSelector:@selector(tableView:didSelectRowAtIndexPath:) fromProtocol:@protocol(UITableViewDelegate)];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainTableViewCellModel *cellModel=[self.viewModel.viewModelArray objectAtIndex:indexPath.row];
    return cellModel.height;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainTableViewCellModel *cellModel=[self.viewModel.viewModelArray objectAtIndex:indexPath.row];
    static NSString *cellName=@"MainTableViewCell";
    MainTableViewCell *cell=[MainTableViewCell initTableViewCell:tableView andCellIdentify:cellName];

    [cell bindViewModel:cellModel];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainTableViewCellModel *cellModel=[self.viewModel.viewModelArray objectAtIndex:indexPath.row];
    if (indexPath.row==3) {
        if (self.change) {
            self.change=NO;
            cellModel.height=80;
        }
        else{
            self.change=YES;
            cellModel.height=100;
        }
    }

    NSInteger i=0;
    for (MainTableViewCellModel *model in self.viewModel.viewModelArray) {
        NSInteger count=i+indexPath.row*10;
        NSString *str=[NSString stringWithFormat:@"%ld",count];
        model.subTitle=str;
        i++;
    }
    
    [self.mainTableView reloadData];
    
    
}


-(void)dealloc
{
    NSLog(@"MainViewController 销毁");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
