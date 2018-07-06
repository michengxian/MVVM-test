//
//  MVVM_testTests.m
//  MVVM-testTests
//
//  Created by biostime on 2018/6/25.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AppCoordinator.h"
#import "LoginCoordinator.h"
#import "LoginViewModel.h"
#import "LoginViewController.h"
#import "MainViewController.h"
#import "MainCoordinator.h"
#import "FirstViewController.h"
#import "OCMock.h"
#import "ComunicationService.h"

@interface MVVM_testTests : XCTestCase

@end

@implementation MVVM_testTests
//waitForExpectationsWithTimeout是等待时间，超过了就不再等待往下执行。
#define WAIT do {\
[self expectationForNotification:@"RSBaseTest" object:nil handler:nil];\
[self waitForExpectationsWithTimeout:30 handler:nil];\
} while (0);

#define NOTIFY \
[[NSNotificationCenter defaultCenter]postNotificationName:@"RSBaseTest" object:nil];


- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}



- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    AppCoordinator *appCoor=[[AppCoordinator alloc]init];
    [appCoor launch];
    
    LoginCoordinator *loginCoor=appCoor.coordinators.lastObject;
    LoginViewController *loginVC=loginCoor.navigationController.viewControllers.lastObject;
    [loginVC.viewModel.delegate loginVC:loginVC.viewModel];
    
    MainCoordinator *mainCoor=appCoor.coordinators.lastObject;
    MainViewController *mVC=mainCoor.navigationController.viewControllers.lastObject;
    [mVC.viewModel.delegate pushVC:[NSIndexPath indexPathForRow:0 inSection:1]];
    
    [[ComunicationService defaultService] get:test1 params:nil success:^(id data) {
        NSLog(@"success");
    } fail:^(id data) {
        NSLog(@"fail");
    }];
    WAIT
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        
//        AppCoordinator *appCoor=[[AppCoordinator alloc]init];
//        [appCoor launch];
//
//        LoginCoordinator *loginCoor=appCoor.coordinators.lastObject;
//        LoginViewController *loginVC=loginCoor.navigationController.viewControllers.lastObject;
//        LoginViewModel *viewModel=[OCMockObject mockForClass:[LoginViewModel class]];
//
//        [loginVC.viewModel.delegate loginVC:viewModel];
//
//        MainCoordinator *mainCoor=appCoor.coordinators.lastObject;
//        MainViewController *mVC=mainCoor.navigationController.viewControllers.lastObject;
//        [mVC.viewModel.delegate pushVC:[NSIndexPath indexPathForRow:0 inSection:1]];
    }];
}

@end
