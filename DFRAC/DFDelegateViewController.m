//
//  DFDelegateViewController.m
//  DFRAC
//
//  Created by 粱展焯 on 16/8/22.
//  Copyright © 2016年 梁展焯. All rights reserved.
//

#import "DFDelegateViewController.h"

@interface DFDelegateViewController ()
//<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *textField2;

@property (nonatomic) RACDelegateProxy *proxy;

@end

@implementation DFDelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Delegate";
    
    // Delegate
//    [self delegate];
    
    // RAC
    [self together];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

#pragma mark - Delegate
-(void)delegate{
    self.textField.delegate = self;
}

#pragma mark -- TextField Delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if ([textField isEqual:_textField]) {
        [_textField2 becomeFirstResponder];
    }
    
    return YES;
}
#pragma mark - RAC
- (void)together{
    

    // 1. 定义代理
    self.proxy = [[RACDelegateProxy alloc] initWithProtocol:@protocol(UITextFieldDelegate)];
    // 2. 代理去注册文本框的监听方法
    [[self.proxy rac_signalForSelector:@selector(textFieldShouldReturn:)]
     subscribeNext:^(id x) {

 
             [self.textField2 becomeFirstResponder];
         
     }];
    self.textField.delegate = (id<UITextFieldDelegate>)self.proxy;
    
}

@end
