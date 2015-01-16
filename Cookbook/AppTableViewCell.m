//
//  AppTableViewCell.m
//  Cookbook
//
//  Created by chengfang on 14-11-30.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "AppTableViewCell.h"
#import "AppModel.h"
@implementation AppTableViewCell

- (void)awakeFromNib
{
    _leftLable.layer.borderWidth=1;
    _leftLable.layer.borderColor=kGetColor(0.4902, 0.6353, 0.1686, 1).CGColor;
    _leftLable.layer.cornerRadius=5;
    _leftLable.layer.masksToBounds=YES;
    
    _image.layer.cornerRadius=5;
    _image.layer.masksToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setAppModel:(AppModel *)appModel
{
    _appModel=appModel;
    [_image setImageWithURL:[NSURL URLWithString:appModel.image] placeholderImage:[UIImage imageNamed:@"page_image_loading.png"] options:SDWebImageRetryFailed|SDWebImageLowPriority];
    _title.text=appModel.title;
    _desc.text=appModel.desc;
}

@end
