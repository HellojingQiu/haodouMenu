//
//  CBTabBar.m
//  Cookbook
//
//  Created by chengfang on 14-11-25.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "CBTabBar.h"
#import "CBTabBarItem.h"
#define kItemTag 10
@interface CBTabBar()
{
    CBTabBarItem *_selectedItem;
}
@end

@implementation CBTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

//        UIImage *bg=[UIImage imageNamed:@"Default_yycz.png"];
        
//        self.image=[bg stretchableImageWithLeftCapWidth:bg.size.width*0.5 topCapHeight:bg.size.height*0.5];
        self.backgroundColor=[UIColor whiteColor];
        self.userInteractionEnabled=YES;
        
        UIImageView *line=[[UIImageView alloc] init];
        UIImage *lineImage= [UIImage imageNamed:@"line.png"];
        line.image=[lineImage stretchableImageWithLeftCapWidth:2 topCapHeight:2];
        
        line.frame=CGRectMake(0, 0,kScreenWidth, 1);
        [self addSubview:line];
    }
    return self;
}

#pragma mark 添加子item
-(void)addTabBarItemWithIcon:(NSString *)iconName title:(NSString *)title
{
    CBTabBarItem *item=[[CBTabBarItem alloc] init];
    [item setTitle:title forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:[iconName appendStringByKey:@"_on" str:iconName]]
          forState:UIControlStateSelected];
    [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:item];
    //重新计算位置
    [self adjustItemFrame];
    
    if (self.subviews.count==2) {
        [self itemClick:item];
    }
}

#pragma mark 添加没有label的item
-(void)addTabBarItemWithIcon:(NSString *)iconName
{
    UIButton *item=[UIButton buttonWithType:UIButtonTypeCustom];
    [item setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:[iconName appendStringByKey:@"_on" str:iconName]]
          forState:UIControlStateSelected];
    [item addTarget:self action:@selector(itemClick2:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:item];
    //重新计算位置
    [self adjustItemFrame];
    
//    if (self.subviews.count==2) {
//        [self itemClick:item];
//    }
}

#pragma mark 重新计算每个item的位置
-(void)adjustItemFrame
{
    int count=self.subviews.count;
    for (int i=1;  i<count; i++) {
        CBTabBarItem *item=self.subviews[i];
        CGFloat width=self.frame.size.width/(count-1);
        CGFloat height=self.frame.size.height;
        CGFloat x=width*(i-1);
        CGFloat y=0;
        item.frame=CGRectMake(x, y, width, height);
        item.tag=kItemTag+i-1;
    }
}
#pragma mark 点击事件
-(void)itemClick:(CBTabBarItem *)item;
{
    if (_itemClickBlock) {
        _itemClickBlock(item.tag-10);
    }
    _selectedItem.selected=NO;
    item.selected=YES;
    _selectedItem=item;
}

#pragma mark 点击事件
-(void)itemClick2:(UIButton *)item
{
    if (item.tag-10==1) {
        item.selected=!item.selected;
    }
    
    if (_itemClickBlock) {
        _itemClickBlock(item.tag-10);
    }
}

@end
