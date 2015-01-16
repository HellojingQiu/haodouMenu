//
//  CBTabBarItem.m
//  Cookbook
//
//  Created by chengfang on 14-11-25.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "CBTabBarItem.h"

@implementation CBTabBarItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode=UIViewContentModeScaleAspectFit;
        self.titleLabel.font=[UIFont systemFontOfSize:12];
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted{}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, CGRectGetMaxY(self.imageView.frame)-2, contentRect.size.width, contentRect.size.height*0.4);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 5, contentRect.size.width, contentRect.size.height*0.5);
}

@end
