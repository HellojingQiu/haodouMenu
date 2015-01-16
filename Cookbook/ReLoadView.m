//
//  ReLoadView.m
//  Cookbook
//
//  Created by chengfang on 14-12-3.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "ReLoadView.h"

@implementation ReLoadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor=kAllBgColor;
        [self addItems];
        
    }
    return self;
}

-(void)addItems
{
    UILabel *label=[[UILabel alloc] init];
    label.text=@"亲,你的网速不给力,点我刷新吧!";
    label.bounds=CGRectMake(0, 0, 200, 50);
    label.textColor=kGetColor(0.4902, 0.6353, 0.1686, 1);
    label.font=[UIFont systemFontOfSize:14];
    label.center=CGPointMake(self.frame.size.width/2, self.frame.size.width/2);
    [self addSubview:label];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_reloadBlock) {
        _reloadBlock();
    }
}

@end
