//
//  SencondViewController.m
//  MVVM-test
//
//  Created by biostime on 2018/6/25.
//  Copyright © 2018年 biostime. All rights reserved.
//

#import "SencondViewController.h"
#import "SencondViewModel.h"

@interface SencondViewController ()

@property  (nonatomic ,strong)RACDisposable *subscriber;

@end

@implementation SencondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"SencondViewController";
    
    NSLog(@"SencondViewController");
    
    [self distinctUntilChanged_test];
//    [self takeUntil_test];
    
//    [self take_test];
    
//    [self ignore_test];
    
//    [self flattenMap_test];
    
//    [self map_test];
    
//    [self liftSelector_test];
    
//    [self dict_test];
    
//    [self array_test];
    
    
//        [self signal_test];
    
//    [self RACCommand_test];
//    [self RACMulticastConnection_test];
//    [self RACSubject_test];
//    [self RACSignal_test];
}

-(void)distinctUntilChanged_test
{
    RACSubject *subject=[RACSubject subject];
    [[subject distinctUntilChanged]subscribeNext:^(id  _Nullable x) {
        NSLog(@"x- %@",x);
    }];
//    [subject sendNext:@"1"];
//    [subject sendNext:@"1"];
//    [subject sendNext:@"2"];
    
    SencondViewModel *model=[[SencondViewModel alloc]init];
    model.test=@"1";
    [subject sendNext:model];
    
    SencondViewModel *model1=[[SencondViewModel alloc]init];
    model1.test=@"1";
    [subject sendNext:model1];
}

-(void)takeUntil_test
{
    RACSubject *subject=[RACSubject subject];
    RACSubject *subject1=[RACSubject subject];
    
    [[subject takeUntil:subject1] subscribeNext:^(id  _Nullable x) {
        NSLog(@"x- %@",x);
    }];
    [subject1 subscribeNext:^(id  _Nullable x) {
        NSLog(@"x1- %@",x);
    }];
    [subject sendNext:@"1"];
    [subject sendNext:@"2"];
    
    [subject1 sendNext:@"3"];
    
    [subject sendNext:@"4"];
    [subject sendNext:@"5"];
    
}

-(void)take_test
{
    RACSubject *subject=[RACSubject subject];
//    [[subject take:1] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x- %@",x);
//    }];
    [[subject takeLast:1] subscribeNext:^(id  _Nullable x) {
        NSLog(@"x1- %@",x);
    }];
    [subject sendNext:@"333"];
    [subject sendNext:@"222"];
    [subject sendNext:@"111"];
    
    [subject sendCompleted];
}

-(void)ignore_test
{
    RACSubject *subject=[RACSubject subject];
    [[subject ignore:@"1"] subscribeNext:^(id  _Nullable x) {
        NSLog(@"x- %@",x);
    }];
    [subject sendNext:@"1"];
    [subject sendNext:@"2"];
    [subject sendNext:@"3"];
}

-(void)flattenMap_test
{
    RACSubject *subject=[RACSubject subject];

   RACDisposable *disposable = [[subject flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
        NSLog(@"value- %@",value);
        value=[NSString stringWithFormat:@"%@ 在后面加点什么",value];
        return [RACSignal return:value];
    }]subscribeNext:^(id  _Nullable x) {
        NSLog(@"x- %@", x);
    }];
    [subject sendNext:@"发送消息"];
    
}

-(void)map_test
{
    RACSubject *subject=[RACSubject subject];
    [[subject map:^id _Nullable(id  _Nullable value) {
        NSLog(@"value- %@",value);
        return [NSString stringWithFormat:@"%@ 在后面加点东西",value];
    }] subscribeNext:^(id  _Nullable x) {
        NSLog(@"x- %@",x);
    }] ;
    [subject sendNext:@"发送消息"];
}

-(void)liftSelector_test
{
    RACSignal *signal1=[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"准备信号1");
        [subscriber sendNext:@"信号1"];
        return nil;
    }];
    RACSignal *signal2=[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"准备信号2");
        [subscriber sendNext:@"信号2"];
        return nil;
    }];
    RACSignal *signal3=[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"准备信号3");
        [subscriber sendNext:@"信号3"];
        return nil;
    }];
    
    [self rac_liftSelector:@selector(getAllSignal1: signal2: signal3:) withSignalsFromArray:@[signal1,signal2,signal3]];
}

-(void)getAllSignal1:(RACSignal *)signal1 signal2:(RACSignal *)signal2 signal3:(RACSignal *)signal3
{
    NSLog(@"加载完毕：signal1 - %@ signal2 - %@ signal3 - %@",signal1,signal2,signal3);
}

-(void)dict_test
{
    NSDictionary *dict=@{
                         @"123":@"name",
                         @"456":@"key",
                         @"789":@"num"
                         };
    [dict.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
        RACTupleUnpack(NSString *key,id value) = x;
        NSLog(@"x-%@",x);

        NSLog(@"key- %@ value- %@",key,value);
    }];
    
}

-(void)array_test
{
    NSArray *array=@[@"1",@"2",@"3",@"4",@"5"];
    [array.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"x-%@",x);
    }];
    
//    RACSequence *sequence=array.rac_sequence;
//    RACSignal *signal=sequence.signal;
//    [signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x-%@",x);
//    }];
}


-(void)signal_test
{
    RACSubject *signalInSignal=[RACSubject subject];
    RACSubject *signal1=[RACSubject subject];
//    RACSubject *signal2=[RACSubject subject];
//    RACSubject *signal3=[RACSubject subject];
//    RACSubject *signal4=[RACSubject subject];
    
//    [signalInSignal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"signalInSignal-x %@",x);
//        [x subscribeNext:^(id  _Nullable x) {
//            NSLog(@"x-x %@",x);
//        }];
//    }];
//    [signalInSignal sendNext:signal1];
    
//    [signalInSignal sendNext:@"signalInSignal 发送消息"];
    [signalInSignal.switchToLatest subscribeNext:^(id  _Nullable x) {
        NSLog(@"signalInSignal.switchToLatest-x %@",x);
    }];
    [signalInSignal sendNext:signal1];
//    [signalInSignal sendNext:signal2];
//    [signalInSignal sendNext:signal3];
//    [signalInSignal sendNext:signal4];

    [signal1 sendNext:@"signal1 发送消息"];
//    [signal2 sendNext:@"signal2 发送消息"];
//    [signal3 sendNext:@"signal3 发送消息"];
//    [signal4 sendNext:@"signal4 发送消息"];

    
}

-(void)RACCommand_test
{
    RACCommand *command=[[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        
        NSLog(@"input %@",input);
        
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            
            [subscriber sendNext:@"RACSignal 发送数据"];
            NSLog(@"还没结束");
            [subscriber sendCompleted];
            NSLog(@"结束了吗");
            return nil;
        }];
    }];
    //方法一
//    RACSignal *signal=[command execute:@"command发送数据"];
//    [signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"signal - %@",x);
//    }];
    //方法二
    [command.executionSignals subscribeNext:^(id  _Nullable x) {
        NSLog(@"command.executionSignals- %@",x);
        [x subscribeNext:^(id  _Nullable x) {
            NSLog(@"x-x  %@",x);
        }];
    }];
    //必须写在订阅后
    [command execute:@"command发送数据"];
    
    [[command.executing skip:1]subscribeNext:^(NSNumber * _Nullable x) {
        if ([x boolValue]) {
            NSLog(@"还在执行");
        }else{
            NSLog(@"执行结束了");
        }
    }];
}

-(void)RACMulticastConnection_test
{
    RACSignal *signal=[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"发起网络请求");
        [subscriber sendNext:@"得到网络数据"];
        return nil;
    }];
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"signal-1-%@",x);
    }];
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"signal-2-%@",x);
    }];
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"signal-3-%@",x);
    }];

//    RACMulticastConnection *connection=[signal publish];
//    [connection.signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"connection-1-%@",x);
//    }];
//    [connection.signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"connection-2-%@",x);
//    }];
//    [connection.signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"connection-3-%@",x);
//    }];
//    [connection connect];
}

-(void)RACReplaySubject_test
{
    RACReplaySubject *subject=[RACReplaySubject subject];
    [subject sendNext:@"发送消息"];
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
}

-(void)RACSubject_test
{
    RACSubject *subject=[RACSubject subject];
    [subject sendNext:@"收不到？"];

    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"1- %@",x);
    }];
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"2- %@",x);
    }];
    NSLog(@"准备发送数据");
    [subject sendNext:@"发送数据"];
    [subject sendNext:@"发送数据-1"];
    NSLog(@"发送完毕");
}

-(void)RACSignal_test
{
    RACSignal *signal=[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"准备发送点什么");
        [subscriber sendNext:@"发送点什么"];
        //函数结束时，subscriber并没有结束
        self.subscriber=subscriber;
        NSLog(@"已经发送了");
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"销毁");
        }];
    }];
    
    //订阅信号量
    RACDisposable *disposable=[signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    //手动取消订阅
    NSLog(@"准备手动销毁订阅");
    [disposable dispose];
    NSLog(@"已经销毁完毕");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
