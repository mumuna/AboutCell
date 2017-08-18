


//
//  TagRightCell.m
//  TianJinDL
//
//  Created by apple on 17/8/14.
//  Copyright © 2017年 troilamac. All rights reserved.
//

#import "TagRightCell.h"
#import <UIKit/UIKit.h>
#define SCREEN_WIDTH         [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT     [UIScreen mainScreen].bounds.size.height
@implementation TagRightCell
{
    UIImageView *templeteImg;
    UILabel *markLab;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _delete = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-175, 15,15, 15)];
        [_delete setBackgroundImage:[UIImage imageNamed:@"delete_button_blue"] forState:UIControlStateNormal];
        [self.contentView addSubview:_delete];
        _share = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-175, 58, 15, 15)];
        [_share setBackgroundImage:[UIImage imageNamed:@"share_buton_blue"] forState:UIControlStateNormal];
        [self.contentView addSubview:_share];
        templeteImg = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH-227, 40)];
        [self.contentView addSubview:templeteImg];
        templeteImg.contentMode = UIViewContentModeScaleToFill;
        markLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 70, SCREEN_WIDTH-215, 15)];
        [markLab setTextColor:[UIColor darkGrayColor]];
        [markLab setTextAlignment:NSTextAlignmentCenter];
        [markLab setFont:[UIFont systemFontOfSize:13]];
        [self.contentView addSubview:markLab];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}
-(void)setSpecificData:(NSDictionary *)model{
    templeteImg.image = [UIImage imageNamed:[model objectForKey:@"image"]];
    [markLab setText:[model objectForKey:@"name"]];
}
-(void)setYunData:(NSDictionary *)model{
    templeteImg.image = [UIImage imageNamed:[model objectForKey:@"image"]];
    [markLab setText:[model objectForKey:@"name"]];
}
@end
