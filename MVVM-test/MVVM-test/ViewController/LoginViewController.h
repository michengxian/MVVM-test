//
//  LoginViewController.h
//  MVVM-test
//
//  Created by biostime on 2018/6/28.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewModel.h"

@interface LoginViewController : UIViewController

@property (nonatomic , strong) LoginViewModel *viewModel;

@end
