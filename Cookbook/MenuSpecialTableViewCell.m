//
//  MenuSpecialTableViewCell.m
//  Cookbook
//
//  Created by chengfang on 14-12-1.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "MenuSpecialTableViewCell.h"
#import "MenuSpecial.h"
@implementation MenuSpecialTableViewCell

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

-(void)setMenuSpecial:(MenuSpecial *)menuSpecial
{
    _menuSpecial=menuSpecial;
    [_coverImage setImageWithURL:[NSURL URLWithString:menuSpecial.cover] placeholderImage:[UIImage imageNamed:@"page_image_loading.png"] options:SDWebImageRetryFailed|SDWebImageLowPriority];
    _recipeCount.text=[NSString stringWithFormat:@"%d",menuSpecial.recipeCount];
    _title.text=menuSpecial.title;
    _uaerName.text=menuSpecial.userName;
}

@end
