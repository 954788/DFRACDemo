//
//  DFBroadcastViewController.m
//  DFRAC
//
//  Created by 粱展焯 on 16/8/22.
//  Copyright © 2016年 梁展焯. All rights reserved.
//

#import "DFBroadcastViewController.h"

@interface DFBroadcastViewController ()

@end

@implementation DFBroadcastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"Broadcast";
    
    // addObserver
//    [self addObserver];
    
    // RAC
    [self together];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - 添加广播
#pragma mark --AddObserver
- (void)addObserver{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receive:) name:@"Broadcast" object:nil];
    
}

#pragma mark -- 接收
- (void)receive:(NSNotification *)notification{
    
    NSDictionary *dic = notification.userInfo;
    
    NSLog(@"%@",dic);
    
}

#pragma mark - RAC
- (void)together{
    
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"Broadcast" object:nil] subscribeNext:^(NSNotification *x) {
        
        NSDictionary *dic = x.userInfo;
        
        NSLog(@"%@",dic);
        
    }];
    
}

#pragma mark - 按钮点击事件
#pragma mark -- 发广播
- (IBAction)tap:(id)sender {
    
    [[NSNotificationCenter defaultCenter]
        postNotificationName:@"Broadcast"
                      object:self
                    userInfo:@{
                                @"what":@"Broadcast"
                                }
     ];
    
}


@end
