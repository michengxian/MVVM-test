//
//  LoginViewModel.m
//  MVVM-test
//
//  Created by biostime on 2018/6/28.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import "LoginViewModel.h"
#import "ComunicationService.h"

@implementation LoginViewModel

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
    RACSignal *accountSignal=[[[RACObserve(self, account) map:^id _Nullable(id  _Nullable value) {
        NSString *string=(NSString *)value;
        return @(string.length>0);
    }] skip:1] distinctUntilChanged];
    
    RACSignal *passwordSignal=[[[RACObserve(self, password) map:^id _Nullable(id  _Nullable value) {
        NSString *string=(NSString *)value;
        return @(string.length>0);
    }] skip:1] distinctUntilChanged];
    
    RACSignal *signal=[RACSignal combineLatest:@[accountSignal,passwordSignal] reduce:^(NSNumber *acValid,NSNumber*passValid){
        return @([acValid boolValue] && [passValid boolValue]);
    }];
    
    self.loginCommand = [[RACCommand alloc]initWithEnabled:signal signalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [[ComunicationService defaultService] get:test1 params:nil success:^(id data) {
                if ([self.delegate respondsToSelector:@selector(loginVC:)]) {
                    LoginViewModel *model=[[LoginViewModel alloc]init];
                    [self.delegate loginVC:model];
                }
            } fail:^(id data) {
                
            }];
            return nil;
        }];
    }];
//
//    self.loginCommand=[[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
//       return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//
//           [[ComunicationService defaultService] get:test1 params:nil success:^(id data) {
//               if ([self.delegate respondsToSelector:@selector(loginVC:)]) {
//                   LoginViewModel *model=[[LoginViewModel alloc]init];
//                   [self.delegate loginVC:model];
//               }
//           } fail:^(id data) {
//
//           }];
//
//
//
//            return nil;
//       }];
//    }];
    
//    [RACObserve(self, loginSignal) subscribeNext:^(id  _Nullable x) {
//        [self.loginSignal subscribeNext:^(id  _Nullable x) {
//            if ([self.delegate respondsToSelector:@selector(loginVC:)]) {
//                LoginViewModel *model=[[LoginViewModel alloc]init];
//                [self.delegate loginVC:model];
//            }
//        }];
//    }];
}


@end
