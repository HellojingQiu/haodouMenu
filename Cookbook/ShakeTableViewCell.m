//
//  ShakeTableViewCell.m
//  Cookbook
//
//  Created by chengfang on 14-11-29.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "ShakeTableViewCell.h"
#import "ShakeModel.h"
@implementation ShakeTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setShakeModel:(ShakeModel *)shakeModel
{
    _shakeModel=shakeModel;
    
    [_iconImage setImageWithURL:[NSURL URLWithString:shakeModel.cover] placeholderImage:[UIImage imageNamed:@"page_image_loading.png"] options:SDWebImageRetryFailed|SDWebImageLowPriority];
    _title.text=shakeModel.title;
    _des.text=shakeModel.stuff;
    
}

@end
