//
//  ImageButton.m
//  Cookbook
//
//  Created by chengfang on 14-11-30.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "ImageButton.h"
#import "BottomModule.h"
@interface ImageButton()
{
    UIImageView *_imageView;
    UILabel *_label;
}
@end

@implementation ImageButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubitems];
        
    }
    return self;
}

-(void)addSubitems
{
    _imageView=[[UIImageView alloc] init];
    [self addSubview:_imageView];
    _label=[[UILabel alloc] init];
    _label.font=[UIFont systemFontOfSize:13];
    _label.textColor=[UIColor darkGrayColor];
    _label.textAlignment=NSTextAlignmentCenter;
    [self addSubview:_label];
}

-(void)setBottomModule:(BottomModule *)bottomModule
{
    _bottomModule=bottomModule;
    _imageView.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*0.87);
    [_imageView setImageWithURL:[NSURL URLWithString:bottomModule.image] placeholderImage:[UIImage imageNamed:@"page_image_loading.png"] options:SDWebImageRetryFailed|SDWebImageLowPriority];
    _label.frame=CGRectMake(0, CGRectGetMaxY(_imageView.frame)+5, self.frame.size.width, self.frame.size.height*0.13);
    _label.text=bottomModule.title;
}

#pragma mark 点击事件
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_operation) {
        _operation(_bottomModule);
    }
}

@end
