//
//  DFLoginViewController.m
//  DFRAC
//
//  Created by 粱展焯 on 16/8/22.
//  Copyright © 2016年 梁展焯. All rights reserved.
//

#import "DFLoginViewController.h"
#import "DFLoginViewModel.h"

@interface DFLoginViewController ()

@property (strong, nonatomic) DFLoginViewModel *viewModel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;


@end

@implementation DFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"MVVM + RAC";
    
    self.imageView.layer.masksToBounds = YES;
    
    [self bindModel];
    
    [self loginAction];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}

- (void) bindModel{
    
    _viewModel = [[DFLoginViewModel alloc]init];
    
    RAC(self.viewModel, userName) = self.nameTextField.rac_textSignal;
    RAC(self.viewModel, password) = self.passwordTextField.rac_textSignal;
    RAC(self.loginButton, enabled) = [_viewModel buttonIsValid];
    
    
//    [self.viewModel.successObject subscribeNext:^(NSArray *x) {
//    
//        NSLog(@"登录成功");
//        
//    }];
//    
//    [self.viewModel.failureObject subscribeNext:^(id x) {
//        
//    }];
//    
//    [self.viewModel.errorObject subscribeNext:^(id x) {
//        
//    }];
    
}

- (void)loginAction{
    
    [[self.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside]
    subscribeNext:^(id x) {
        [_viewModel login];
    }];
    
}

@end
