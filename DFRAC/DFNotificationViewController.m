//
//  DFNotificationViewController.m
//  DFRAC
//
//  Created by 粱展焯 on 16/8/22.
//  Copyright © 2016年 梁展焯. All rights reserved.
//

#import "DFNotificationViewController.h"

@interface DFNotificationViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation DFNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Notification";
    
    // Notification
//    [self notification];
    
    // RAC
    [self together];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"UIKeyboardWillChangeFrameNotification" object:nil];
}

#pragma mark - Notification
-(void)notification{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receive) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}


-(void)receive{
    
    NSLog(@"123");
    
}

#pragma mark - RAC
-(void)together{
    
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillChangeFrameNotification object:nil] subscribeNext:^(id x) {
        NSLog(@"123");
    }];
    
}




















-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_textField resignFirstResponder];
}

@end
