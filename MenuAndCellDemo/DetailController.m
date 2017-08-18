//
//  DetailController.m
//  MenuAndCellDemo
//
//  Created by 王娜 on 2017/8/17.
//  Copyright © 2017年 王娜. All rights reserved.
//

#import "DetailController.h"
#import "TagLeftCell.h"
#import "TagRightCell.h"
#define SCREEN_WIDTH         [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT     [UIScreen mainScreen].bounds.size.height
@interface DetailController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation DetailController
{
    UITableView *leftTable;
    UITableView *localTable;//英国
    UITableView *rightTable;//多伦多
    UITableView *specificTable;//澳大利亚
    
    NSArray *YinGuoArr;//英国
    NSArray *yunArr;//多伦多
    
    NSMutableArray *specificArr;//澳大利亚
    NSMutableArray *flagArr;
    NSArray *headArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"你的国度";
 
    [self setNav];
    
    [self setSearchBar];
    [self setMain];
}
-(void)setNav{
    //返回键
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    [btn setImage:[UIImage imageNamed:@"back_button_white"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
}
-(void)setSearchBar{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(28, 71, SCREEN_WIDTH-100, 30)];
    view.layer.borderColor = ([UIColor lightGrayColor].CGColor);
    view.layer.borderWidth = 0.5;
    view.layer.cornerRadius = 5;
    [self.view addSubview:view];
    UIButton *confirm = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-56,71, 40, 30)];
    [confirm setTitle:@"确定" forState:UIControlStateNormal];
    [confirm setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [confirm.titleLabel setFont:[UIFont fontWithName:@"SourceHanSansCN-Normal" size:16]];
    [self.view addSubview:confirm];
    [confirm addTarget:self action:@selector(confimSearch) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(5, 7.5, 15, 15)];
    img.image  = [UIImage imageNamed:@"search_icon_grey"];
    [view addSubview:img];
    UIButton *code = [[UIButton alloc]initWithFrame:CGRectMake(view.frame.size.width-21, 7.5, 15, 15)];
    [code setBackgroundImage:[UIImage imageNamed:@"scan_grey_icon"] forState:UIControlStateNormal];
    [view addSubview:code];
    [code addTarget:self action:@selector(erWeiMa) forControlEvents:UIControlEventTouchUpInside];
    UITextField *search = [[UITextField alloc]initWithFrame:CGRectMake(25, 8, view.frame.size.width-50, 16)];
    search.placeholder = @"你想往的国家";
    [search setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    [view addSubview:search];
}
-(void)setMain{
  
   
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    yunArr = [[NSMutableArray alloc]init];
    specificArr = [[NSMutableArray alloc]init];
    flagArr = [[NSMutableArray alloc]init];
    YinGuoArr = @[@{@"image":@"timg-9",@"name":@"西蒙菲莎大学"},@{@"image":@"timg-7",@"name":@"滑铁卢大学"},@{@"image":@"timg-3",@"name":@"维多利亚大学"},@{@"image":@"timg-1",@"name":@"圭尔夫大学"}];
    
    leftTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 108, 130, SCREEN_HEIGHT-108) style:UITableViewStyleGrouped];
    leftTable.delegate = self;
    leftTable.dataSource = self;
    [self.view addSubview:leftTable];
    [leftTable registerClass:[TagLeftCell class] forCellReuseIdentifier:@"leftcell"];
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(130, 108, 0.3, SCREEN_HEIGHT-108)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line];
    
    localTable = [[UITableView alloc]initWithFrame:CGRectMake(130.3, 108, SCREEN_WIDTH-130.3, SCREEN_HEIGHT-108) style:UITableViewStyleGrouped];
    localTable.delegate = self;
    localTable.dataSource = self;
    [localTable registerClass:[TagRightCell class] forCellReuseIdentifier:@"localcell"];
    [self.view addSubview:localTable];
    
    
    rightTable = [[UITableView alloc]initWithFrame:CGRectMake(130.3, 108, SCREEN_WIDTH-130.3, SCREEN_HEIGHT-108) style:UITableViewStyleGrouped];
    rightTable.delegate = self;
    rightTable.dataSource = self;
    [rightTable registerClass:[TagRightCell class] forCellReuseIdentifier:@"rightcell"];
    
    
    
    specificTable = [[UITableView alloc]initWithFrame:CGRectMake(130.3, 108, SCREEN_WIDTH-130.3, SCREEN_HEIGHT-108) style:UITableViewStyleGrouped];
    specificTable.delegate = self;
    specificTable.dataSource = self;
    [specificTable registerClass:[TagRightCell class] forCellReuseIdentifier:@"specificcell"];
    
    
    
}
#pragma mark -- Click
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)confimSearch{
    //
}
-(void)erWeiMa{
    
    
}
#pragma mark -- UITableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == specificTable) {
        return specificArr.count;
    }
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == specificTable) {
        NSArray *arr = specificArr[section];
        return  arr.count;
    }
    if (tableView==rightTable) {
        return yunArr.count;
    }
    if (tableView == localTable) {
        return YinGuoArr.count;
    }
    return 3;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == leftTable) {
        TagLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leftcell"];
        NSArray *titleArr = @[@"英国",@"多伦多",@"澳大利亚"];
        [cell setData:titleArr[indexPath.row]];
        //默认选中第一行
        NSIndexPath *ip=[NSIndexPath indexPathForRow:0 inSection:0];
        [leftTable selectRowAtIndexPath:ip animated:YES scrollPosition:UITableViewScrollPositionBottom];
        
        return cell;
    }
    if (tableView == specificTable) {
        TagRightCell *specificcell = [tableView dequeueReusableCellWithIdentifier:@"specificcell"];
        specificcell.delete.hidden = YES;
        specificcell.share.hidden = YES;
        NSDictionary *model = specificArr[indexPath.section][indexPath.row];
        NSLog(@"索取的是%@",model);
        [specificcell setSpecificData:model];
        specificcell.clipsToBounds = YES;
        return specificcell;
    }
    if (tableView == rightTable) {
        TagRightCell *rightcell= [tableView dequeueReusableCellWithIdentifier:@"rightcell"];
        NSDictionary *yun = yunArr[indexPath.row];
        [rightcell setYunData:yun];
        return rightcell;
    }
    //英国
    TagRightCell *localcell= [tableView dequeueReusableCellWithIdentifier:@"localcell"];
    NSDictionary *yin = YinGuoArr[indexPath.row];
    [localcell setYunData:yin];
    return localcell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == leftTable) {
        return 44;
    }
    if (tableView == specificTable) {
        if ([flagArr[indexPath.section] isEqualToString:@"0"]) {
            return 0;
        }else{
            return 96;
        }
    }
    return 96;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (tableView == specificTable) {
        return 40;
    }
    return CGFLOAT_MIN;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == leftTable) {
        if (indexPath.row == 0) {
            //本地模版
            [specificTable removeFromSuperview];
            [rightTable removeFromSuperview];
            [self.view addSubview:localTable];
            if (YinGuoArr.count == 0) {
                YinGuoArr = @[@{@"image":@"timg-1",@"name":@"西蒙菲莎大学"},@{@"image":@"timg-2",@"name":@"滑铁卢大学"},@{@"image":@"timg-3",@"name":@"维多利亚大学"},@{@"image":@"timg-4",@"name":@"圭尔夫大学"}];
            }
            
            [localTable reloadData];
        }
        if (indexPath.row == 1) {
            //获取云模版
            [specificTable removeFromSuperview];
            [localTable removeFromSuperview];
            [self.view addSubview:rightTable];
            if (yunArr.count == 0) {
                yunArr = @[@{@"image":@"timg-1",@"name":@"西蒙菲莎大学"},@{@"image":@"timg-2",@"name":@"滑铁卢大学"},@{@"image":@"timg-3",@"name":@"维多利亚大学"},@{@"image":@"timg-4",@"name":@"圭尔夫大学"}];
            }
            [rightTable reloadData];
        }
        if (indexPath.row == 2) {
            //专用模版
            
            
                [rightTable removeFromSuperview];
                [localTable removeFromSuperview];
                [self.view addSubview:specificTable];
                if (specificArr.count == 0) {
   
          
                 NSArray *arr = @[
  @[
       @{@"image":@"timg-1",@"name":@"澳大利亚国立大学"},@{@"image":@"timg-2",@"name":@"悉尼大学"},@{@"image":@"timg-3",@"name":@"墨尔本大学"}
   ],
  @[
       @{@"image":@"timg-4",@"name":@"昆士兰大学"},@{@"image":@"timg-5",@"name":@"莫纳什大学"},@{@"image":@"timg-6",@"name":@"昆士兰大学"}
   ],
  @[
       @{@"image":@"timg-7",@"name":@"莫纳什大学"},@{@"image":@"timg-8",@"name":@"西澳大学"},@{@"image":@"timg-9",@"name":@"阿德雷德大学"}
   ]
                                    ];
            [specificArr addObjectsFromArray:arr];
                    for (int i = 0; i<specificArr.count; i++) {
                        [flagArr addObject:@"0"];
                    }
                }
            headArr = @[@"五星级大学",@"四星级大学",@"三星级大学"];
                [specificTable reloadData];
            
                
      
        }
        
    }
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (tableView == specificTable) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-130, 40)];
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-130, 0.3)];
        [line setBackgroundColor:[UIColor lightGrayColor]];
        [view addSubview:line];
        UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0.3, SCREEN_WIDTH-130, 39.7)];
        titleLab.text = headArr[section];
        titleLab.textAlignment = NSTextAlignmentCenter;
        [titleLab setFont:[UIFont systemFontOfSize:14]];
        [view addSubview:titleLab];
               view.tag = 100+section;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sectionClick:)];
        [view addGestureRecognizer:tap];
        [view setBackgroundColor:[UIColor whiteColor]];
        return view;
    }
    return nil;
}
-(void)sectionClick:(UITapGestureRecognizer *)tap{
    int index = tap.view.tag%100;
    NSMutableArray *indexArray = [[NSMutableArray alloc]init];
    NSArray *arr = specificArr[index];
    for (int i = 0; i<arr.count; i++) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:i inSection:index];
        [indexArray addObject:path];
    }
    //展开
    if ([flagArr[index] isEqualToString:@"0"]) {
        [flagArr replaceObjectAtIndex:index withObject:@"1"];
        [specificTable reloadData];
        [specificTable reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationBottom];
    }else{
        [flagArr replaceObjectAtIndex:index withObject:@"0"];
        [specificTable reloadData];
        [specificTable reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationBottom];
    }
}
@end

