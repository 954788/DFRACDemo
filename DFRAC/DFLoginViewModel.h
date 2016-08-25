//
//  DFLoginViewModel.h
//  DFRAC
//
//  Created by 粱展焯 on 16/8/22.
//  Copyright © 2016年 梁展焯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DFLoginViewModel : NSObject

@property (nonatomic, strong) NSString *userName;

@property (nonatomic, strong) NSString *password;

@property (nonatomic, strong) RACSubject *successObject;

@property (nonatomic, strong) RACSubject *failureObject;

@property (nonatomic, strong) RACSubject *errorObject;

- (id) buttonIsValid;

- (void) login;

@end
