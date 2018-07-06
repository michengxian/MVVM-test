//
//  MainViewController.h
//  MVVM-test
//
//  Created by biostime on 2018/6/25.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewModel.h"


@interface MainViewController : UIViewController
@property (nonatomic,strong)MainViewModel *viewModel;

@end
