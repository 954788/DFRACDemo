//
//  DFKVOTableViewController.m
//  DFRAC
//
//  Created by 粱展焯 on 16/8/21.
//  Copyright © 2016年 梁展焯. All rights reserved.
//

#import "DFKVOTableViewController.h"

@interface DFKVOTableViewController ()



@end

@implementation DFKVOTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"KVO";
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
//    self.navigationController.navigationBarHidden = YES;
    
    // KVO
//    [self addObserver];
    
    // RAC
    [self together];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

//-(void)dealloc{
//    
//    [self.tableView removeObserver:self forKeyPath:@"contentOffset"];
//    
//}

#pragma mark - KVO
#pragma mark -- 添加监听
- (void)addObserver{

    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

#pragma mark -- 实现
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    CGFloat offset = self.tableView.contentOffset.y;
    CGFloat delta = offset / 64.f + 1.f;
    delta = MAX(0, delta);
    NSLog(@"%f",offset);
    
    self.navigationController.navigationBar.alpha = MIN(1, 1-delta);
    
}




#pragma mark - RAC
#pragma mark -- 添加监听并实现
- (void)together{
    [RACObserve(self.tableView, contentOffset)
     subscribeNext:^(id x) {

         CGFloat offset = self.tableView.contentOffset.y;
         
#warning 有navigation时，使用RAC需补上导航栏的高度
         
         CGFloat delta = (offset - 44.f)/ 64.f + 1.f;
         delta = MAX(0, delta);
         NSLog(@"%f",offset);
         self.navigationController.navigationBar.alpha = MIN(1, 1-delta);
         
         
         
     }];
}







































#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    return cell;
    
}

@end
