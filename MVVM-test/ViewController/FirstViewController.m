//
//  FirstViewController.m
//  MVVM-test
//
//  Created by biostime on 2018/6/26.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIView *scrollerView;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSLog(@"FirstViewController");
    
    [self rac_label];
    [self rac_button];
    [self rac_textField];
    [self rac_imageView];
    [self rac_textView];
    [self rac_scrollerView];
    [self rac_scroll];
    
}

#pragma mark --  rac_label
-(void)rac_label
{
    
}

#pragma mark -- rac_button
-(void)rac_button
{
    [[self.button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"rac_button");
        [self buttonClick];
    }];
}

-(void)buttonClick
{
    NSLog(@"buttonClick");
}


#pragma mark -- rac_textField
-(void)rac_textField
{
    [[self.textField.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
        return value.length>5;
    }] subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    [self.textField.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"%@",x);
    }];
}

#pragma mark -- rac_imageView
-(void)rac_imageView
{
    
}

#pragma mark -- rac_textView
-(void)rac_textView
{
    [self.textView.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"%@",x);
    }];
}

#pragma mark -- rac_scrollerView
-(void)rac_scrollerView
{
    
}

#pragma mark -- rac_scroll
-(void)rac_scroll
{
    
}

@end
