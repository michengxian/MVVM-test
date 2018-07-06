//
//  MainTableViewCell.h
//  MVVM-test
//
//  Created by biostime on 2018/6/25.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *Text;
@property (weak, nonatomic) IBOutlet UILabel *subTitle;

+ (instancetype)initTableViewCell:(UITableView *)tableView andCellIdentify:(NSString *)cellIdentify;//这是一个类方法能供外界调用，传进的参数是tableView 和cell的标识，返回一个任意类型
- (void)bindViewModel:(id)viewModel;



@end
