//
//  LoginSpec.m
//  DFRAC
//
//  Created by 粱展焯 on 16/8/24.
//  Copyright 2016年 梁展焯. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "DFLoginViewModel.h"

SPEC_BEGIN(LoginSpec)

describe(@"LoginClient", ^{
    
    context(@"when user input correct username and password", ^{
 
        DFLoginViewModel *viewModel = [[DFLoginViewModel alloc]init];
        
        beforeEach(^{

            viewModel.userName = @"123";
            viewModel.password = @"123";
           
        });
        
        it(@"should login successfully", ^{

           [viewModel login];
        });
        
    });
});

SPEC_END
