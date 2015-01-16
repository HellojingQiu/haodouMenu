//
//  SubView.m
//  Cookbook
//
//  Created by chengfang on 14-12-3.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "SubView.h"
#import "MenuViewModel.h"
#import "AchievementPicModel.h"
@interface SubView()
{
    UIImageView *_imageView;
    UILabel *_label;
}
@end

@implementation SubView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addItems];
        self.backgroundColor=kAllBgColor;
    }
    return self;
}

-(void)addItems
{
    _imageView=[[UIImageView alloc] init];
    _imageView.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-30);
    [self addSubview:_imageView];
    
    _label=[[UILabel alloc] init];
    _label.frame=CGRectMake(0, CGRectGetMaxY(_imageView.frame), self.frame.size.width, 30);
    _label.textAlignment=NSTextAlignmentCenter;
    _label.font=[UIFont systemFontOfSize:15];
    [self addSubview:_label];
}

-(void)setMenuModel:(MenuViewModel *)menuModel
{
    _menuModel=menuModel;
    if ([menuModel isKindOfClass:[AchievementPicModel class]]) {
        AchievementPicModel *ap=(AchievementPicModel *)menuModel;
        [_imageView setImageWithURL:[NSURL URLWithString:ap.photoUrl] placeholderImage:kLoadImage options:SDWebImageRetryFailed|SDWebImageLowPriority];
        _label.text=ap.createTime;
    }
    else
    {
        [_imageView setImageWithURL:[NSURL URLWithString:menuModel.cover] placeholderImage:kLoadImage options:SDWebImageRetryFailed|SDWebImageLowPriority];
        _label.text=menuModel.title;
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.delegate subViewClick:self model:_menuModel];
}

@end
