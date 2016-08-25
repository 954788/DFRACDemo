//
//  DFTargetViewController.m
//  DFRAC
//
//  Created by 粱展焯 on 16/8/22.
//  Copyright © 2016年 梁展焯. All rights reserved.
//

#import "DFTargetViewController.h"

@interface DFTargetViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation DFTargetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Target";
    
    // Target
    [self addTarget];
    
    // RAC
//    [self together];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

#pragma mark - Target
-(void)addTarget{
    [self.button addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark -- 点击事件
-(void)tap{
    NSLog(@"被点击");
}

#pragma mark - RAC
-(void)together{
    
    [[_button rac_signalForControlEvents:UIControlEventTouchUpInside]
    subscribeNext:^(id x) {
        NSLog(@"被点击");
    }];
    
}

@end
