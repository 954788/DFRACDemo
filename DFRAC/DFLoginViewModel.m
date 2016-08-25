//
//  DFLoginViewModel.m
//  DFRAC
//
//  Created by 粱展焯 on 16/8/22.
//  Copyright © 2016年 梁展焯. All rights reserved.
//

#import "DFLoginViewModel.h"

@interface DFLoginViewModel()

@property (nonatomic, strong) RACSignal *userNameSignal;

@property (nonatomic, strong) RACSignal *passwordSignal;

@property (nonatomic, strong) NSArray *requestData;

@end

@implementation DFLoginViewModel

- (instancetype) init{
    
    self = [super init];
    
    if (self) {
        
        [self initialize];
        
    }
    
    return  self;
}

- (void) initialize{
    
    _userNameSignal = RACObserve(self, userName);
    
    _passwordSignal = RACObserve(self, password);
    
    _successObject = [RACSubject subject];
    
    _failureObject = [RACSubject subject];
    
    _errorObject = [RACSubject subject];
    
}

- (id) buttonIsValid{
    
    RACSignal *isValid = [RACSignal combineLatest:@[_userNameSignal,_passwordSignal]
                          reduce:^id(NSString *userName,NSString *password){
                             
                              return @(userName.length >= 3 && password.length >=3);
                              
                          }];
    
    return isValid;
    
}

- (void) login{
    
    _requestData = @[_userName, _password];
    
    [_successObject sendNext:_requestData];
    
    NSLog(@"成功");
}

@end
