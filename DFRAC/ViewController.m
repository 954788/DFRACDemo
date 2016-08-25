//
//  ViewController.m
//  DFRAC
//
//  Created by 粱展焯 on 16/8/21.
//  Copyright © 2016年 梁展焯. All rights reserved.
//

#import "ViewController.h"
#import "DFKVOTableViewController.h"
#import "DFTargetViewController.h"
#import "DFDelegateViewController.h"
#import "DFNotificationViewController.h"
#import "DFBroadcastViewController.h"
#import "DFLoginViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ReactiveCocoa";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    _array = @[@"KVO -- 键值监听",@"Target -- 添加事件",@"Delegate -- 代理",@"Notification -- 通知",@"Broadcast -- 广播"];
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,nil]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView dataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
            return _array.count;
    }
    else
        return 1;

}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return @"初步使用RAC,减少代码量,增加代码可阅读性";
    }else if (section == 1){
        return @"MVVM + RAC";
    }
   
    
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if (indexPath.section == 0) {
        cell.textLabel.text = _array[indexPath.row];
    }else if (indexPath.section == 1){
        cell.textLabel.text = @"MVVM + RAC";
    }
    
    
    return cell;
}

#pragma mark - tableView delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 取消选中状态
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO];
    
    // section0
    if (indexPath.section == 0) {
    
    if (indexPath.row == 0) {
        DFKVOTableViewController *vc = [[DFKVOTableViewController alloc]initWithNibName:@"DFKVOTableViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        DFTargetViewController *vc = [[DFTargetViewController alloc]initWithNibName:@"DFTargetViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2){
        DFDelegateViewController *vc = [[DFDelegateViewController alloc]initWithNibName:@"DFDelegateViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 3){
        DFNotificationViewController *vc = [[DFNotificationViewController alloc]initWithNibName:@"DFNotificationViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 4){
        DFBroadcastViewController *vc = [[DFBroadcastViewController alloc]initWithNibName:@"DFBroadcastViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
        
    }
    
    // section1
    if (indexPath.section == 1) {
        DFLoginViewController *vc = [[DFLoginViewController alloc]initWithNibName:@"DFLoginViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

@end
