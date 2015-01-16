//
//  FansButton.m
//  Cookbook
//
//  Created by chengfang on 14-12-5.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "FansButton.h"
#import "FansInfo.h"
@interface FansButton()
{
    UIImageView *_iconImage;
    
    UILabel *_userName;
}
@end

@implementation FansButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addItems];
        
    }
    return self;
}

-(void)addItems
{
    _iconImage=[[UIImageView alloc] init];
    _iconImage.frame=CGRectMake(20, 3, self.frame.size.width-40, self.frame.size.width-40);
    _iconImage.layer.cornerRadius=(self.frame.size.width-40)/2;
    _iconImage.layer.masksToBounds=YES;
    [self addSubview:_iconImage];
    
    _userName=[[UILabel alloc] init];
    _userName.frame=CGRectMake(0, CGRectGetMaxY(_iconImage.frame), self.frame.size.width, 16);
    _userName.font=[UIFont systemFontOfSize:10];
    _userName.textAlignment=NSTextAlignmentCenter;
    [self addSubview:_userName];
    
    UIImageView *lineView=[[UIImageView alloc] init];
    lineView.image=kLineImage;
    lineView.frame=CGRectMake(self.frame.size.width, 0, 1, self.frame.size.height);
    [self addSubview:lineView];
    
    UIImageView *lineView2=[[UIImageView alloc] init];
    lineView2.image=kLineImage;
    lineView2.frame=CGRectMake(0,CGRectGetMaxY(_userName.frame), self.frame.size.width, 1);
    [self addSubview:lineView2];
    
}

-(void)setFansInfo:(FansInfo *)fansInfo
{
    _fansInfo=fansInfo;
    [_iconImage setImageWithURL:[NSURL URLWithString:fansInfo.avatar] placeholderImage:kLoadImage options:SDWebImageRetryFailed|SDWebImageLowPriority];
    
    _userName.text=fansInfo.userName;
}



@end
