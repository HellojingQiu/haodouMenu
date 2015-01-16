//
//  RankTableViewCell.m
//  Cookbook
//
//  Created by chengfang on 14-12-9.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "RankTableViewCell.h"
#import "RankUserInfo.h"
@implementation RankTableViewCell

- (void)awakeFromNib
{
    self.backgroundColor=kAllBgColor;
    self.selectionStyle=UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setUserInfo:(RankUserInfo *)userInfo
{
    _userInfo=userInfo;

    _rankIcon.image=[UIImage imageNamed:[NSString stringWithFormat:@"bg_array_before_%.2d.png",_index]];
    _title.text=userInfo.title;
    
    _userName.text=userInfo.userName;
    
    _count.text=[NSString stringWithFormat:@"%d",userInfo.viewCount];
}

@end
