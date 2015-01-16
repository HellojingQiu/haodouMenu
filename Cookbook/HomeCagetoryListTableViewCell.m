//
//  HomeCagetoryListTableViewCell.m
//  Cookbook
//
//  Created by chengfang on 14-11-28.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "HomeCagetoryListTableViewCell.h"
#import "HomeDetialItem.h"

@implementation HomeCagetoryListTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setHomeDetialItem:(HomeDetialItem *)homeDetialItem
{
    _homeDetialItem=homeDetialItem;
    [_iconImage setImageWithURL:[NSURL URLWithString:homeDetialItem.cover] placeholderImage:[UIImage imageNamed:@"page_image_loading.png"] options:SDWebImageRetryFailed|SDWebImageLowPriority];
    _content.text=homeDetialItem.intro;
    _viewCount.text=[NSString stringWithFormat:@"%d",homeDetialItem.viewCount];
    _favoriteCount.text=[NSString stringWithFormat:@"%d",homeDetialItem.favoriteCount];
    _name.text=homeDetialItem.title;
}

@end
