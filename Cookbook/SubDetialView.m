//
//  SubDetialView.m
//  Cookbook
//
//  Created by chengfang on 14-11-27.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "SubDetialView.h"
#import "Collect.h"
#import "Wiki.h"
@implementation SubDetialView

//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        self=[[NSBundle mainBundle] loadNibNamed:@"SubDetialView" owner:nil options:nil][0];
//    }
//    return self;
//}
+(id)initWithNib
{
    return [[NSBundle mainBundle] loadNibNamed:@"SubDetialView" owner:nil options:nil][0];
}
-(void)setModel:(id)model
{
    if ([model isKindOfClass:[Collect class]]) {
        Collect *collect=model;
        _title.text=collect.title;
        _userName.text=collect.userName;
        _content.text=collect.content;
        NSString *imageUrl=collect.cover;
        [_iconImageView setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"page_image_loading.png"] options:SDWebImageRetryFailed|SDWebImageLowPriority];
    }else
    {
        Wiki *wiki=model;
        _title.text=wiki.title;
        _userName.text=wiki.userName;
        _content.text=wiki.content;
        NSString *imageUrl=wiki.cover;
        [_iconImageView setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"page_image_loading.png"] options:SDWebImageRetryFailed|SDWebImageLowPriority];
    }
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellBtn)];
    [self addGestureRecognizer:tap];
   
}

#pragma mark 详细点击事件
-(void)cellBtn
{
    if (_cellClick) {
        _cellClick(_model);
    }
}


@end
