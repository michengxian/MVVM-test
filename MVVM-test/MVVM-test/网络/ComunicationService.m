//
//  ComunicationService.m
//  MVVM-test
//
//  Created by biostime on 2018/7/2.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import "ComunicationService.h"
#import "AFNetworkActivityIndicatorManager.h"

static AFHTTPSessionManager * sessionManager;

@implementation ComunicationService

+ (ComunicationService *)defaultService
{
    static ComunicationService *service=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[ComunicationService alloc]init];
        sessionManager=[self sessionManager];
    });
    return service;
}


+ (AFHTTPSessionManager *)sessionManager
{
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    //    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"FiddlerRoot" ofType:@"cer"];
    //    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    //    NSSet *set = [[NSSet alloc] initWithObjects:certData, nil];
    
    AFHTTPSessionManager *manager = manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];//设置请求数据为json
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//设置返回数据为json
    manager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
    manager.requestSerializer.timeoutInterval=30;
    //    AFSecurityPolicy *security = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:set];
    AFSecurityPolicy *security = [AFSecurityPolicy defaultPolicy];
    security.allowInvalidCertificates = YES;
    security.validatesDomainName = NO;
    manager.securityPolicy = security;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",
                                                                              @"text/html",
                                                                              @"text/json",
                                                                              @"text/plain",
                                                                              @"text/javascript",
                                                                              @"text/xml",
                                                                              @"image/*"]];
    return manager;
}

-(void)get:(NSString *)method params:(NSDictionary *)params success:(SuccessFunction)success fail:(FailFunction)fail
{
    [sessionManager GET:method parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(error.userInfo);
        }
    }];
}

-(void)post:(NSString *)method params:(NSDictionary *)params success:(SuccessFunction)success fail:(FailFunction)fail
{
    [sessionManager POST:method parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(error.userInfo);
        }
    }];
}

@end
