//
//  FirstViewController.h
//  MVVM-test
//
//  Created by biostime on 2018/6/26.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewModel.h"

@interface FirstViewController : UIViewController

@property (nonatomic , strong) FirstViewModel *viewModel;

@end
