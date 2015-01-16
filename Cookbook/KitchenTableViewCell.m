//
//  KitchenTableViewCell.m
//  Cookbook
//
//  Created by chengfang on 14-11-30.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "KitchenTableViewCell.h"
#import "KitchenModel.h"
@implementation KitchenTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setKitchenModel:(KitchenModel *)kitchenModel
{
    _kitchenModel=kitchenModel;
    [_image setImageWithURL:[NSURL URLWithString:kitchenModel.image] placeholderImage:[UIImage imageNamed:@"page_image_loading.png"] options:SDWebImageRetryFailed|SDWebImageLowPriority];
    _titile.text=kitchenModel.title;
    _content.text=kitchenModel.content;
}

@end
