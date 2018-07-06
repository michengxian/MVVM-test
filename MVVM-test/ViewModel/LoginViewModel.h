//
//  LoginViewModel.h
//  MVVM-test
//
//  Created by biostime on 2018/6/28.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LoginViewModelDelegate<NSObject>

-(void)loginVC:(id)viewModel;

@end

@interface LoginViewModel : NSObject

@property (nonatomic , strong) NSString *account;
@property (nonatomic , strong) NSString *password;

@property (nonatomic , strong) RACCommand *loginCommand;

@property (nonatomic , weak) id<LoginViewModelDelegate> delegate;
@property (nonatomic , strong) RACSignal *loginSignal;
@end
