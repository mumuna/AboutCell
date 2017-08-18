//
//  ViewController.m
//  MenuAndCellDemo
//
//  Created by 王娜 on 2017/8/17.
//  Copyright © 2017年 王娜. All rights reserved.
//

#import "ViewController.h"
#import "DetailController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(width/2-100,height/2-15 , 200, 30)];
    [self.view addSubview:btn];
    [btn setTitle:@"观看cell的展开收起及二级菜单" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor grayColor]];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [btn addTarget:self action:@selector(goDetail) forControlEvents:UIControlEventTouchUpInside];
}
-(void)goDetail{
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[DetailController new]];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
