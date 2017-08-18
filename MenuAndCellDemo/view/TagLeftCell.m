//
//  TagLeftCell.m
//  TianJinDL
//
//  Created by 王娜 on 2017/8/15.
//  Copyright © 2017年 troilamac. All rights reserved.
//

#import "TagLeftCell.h"

@implementation TagLeftCell
{
    UILabel *tittleLab;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        tittleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 130, 44)];
        [tittleLab setTextAlignment:NSTextAlignmentCenter];
        [tittleLab setFont:[UIFont systemFontOfSize:14]];
        [self.contentView addSubview:tittleLab];
    }
    return self;
}
-(void)setData:(NSString *)title{
    tittleLab.text = title;
}
@end
