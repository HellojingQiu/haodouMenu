//
//  NutritionTableViewCell.m
//  Cookbook
//
//  Created by chengfang on 14-12-1.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "NutritionTableViewCell.h"
#import "NutritionModel.h"
@implementation NutritionTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setFrame:(CGRect)frame
{
    CGRect newFrame=frame;
    newFrame.size.height-=10;
    [super setFrame:newFrame];
}

-(void)setNutModel:(NutritionModel *)nutModel
{
    _nutModel=nutModel;
    [_image setImageWithURL:[NSURL URLWithString:nutModel.image] placeholderImage:[UIImage imageNamed:@"page_image_loading.png"] options:SDWebImageRetryFailed|SDWebImageLowPriority];
    _content.text=nutModel.content;
    _titile.text=nutModel.title;
}

@end
