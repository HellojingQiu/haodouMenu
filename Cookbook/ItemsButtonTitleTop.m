//
//  ItemsButtonTitleTop.m
//  Cookbook
//
//  Created by chengfang on 14-11-27.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "ItemsButtonTitleTop.h"

@implementation ItemsButtonTitleTop

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, CGRectGetMaxY(self.imageView.frame)-3, contentRect.size.width, contentRect.size.height*0.3);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 10, contentRect.size.width, contentRect.size.height*0.5);
}

@end
