//
//  MVVM_testUITests.m
//  MVVM-testUITests
//
//  Created by biostime on 2018/6/25.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface MVVM_testUITests : XCTestCase

@end

@implementation MVVM_testUITests

- (void)setUp {
    [super setUp];
    
    NSLog(@"开始");
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    NSLog(@"结束");
}

- (void)testExample {
    
    NSLog(@"测试");
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *nameTextField = app.textFields[@"请输入账户名"];
    [nameTextField tap];
    [nameTextField typeText:@"test"];
    
    XCUIElement *passwordTextField = app.textFields[@"请输入密码"];
    [passwordTextField tap];
    [passwordTextField typeText:@"123456"];
    
    [app.buttons[@"登录"] tap];
    
    XCUIElementQuery *tablesQuery = app.tables;
    
    [[tablesQuery.cells containingType:XCUIElementTypeStaticText identifier:@"0"].staticTexts[@"0"] tap];
    [app.navigationBars[@"FirstView"].buttons[@"Back"] tap];
    
    [[tablesQuery.cells containingType:XCUIElementTypeStaticText identifier:@"1"]/*@START_MENU_TOKEN@*/.staticTexts[@"1"]/*[[".cells.staticTexts[@\"1\"]",".staticTexts[@\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    [app.navigationBars[@"SencondViewController"].buttons[@"Back"] tap];
    
    [[tablesQuery.cells containingType:XCUIElementTypeStaticText identifier:@"14"].staticTexts[@"14"] tap];
    
}

@end
