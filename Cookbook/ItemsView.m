//
//  ItemsView.m
//  Cookbook
//
//  Created by chengfang on 14-11-27.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "ItemsView.h"
#import "ItemsButtonTitleTop.h"

#define kItemsIcon @[@"menu_ico_collect.png",@"menu_ico_recipe.png",@"menu_ico_publish.png",@"menu_ico_Camera.png"]
#define kItemsName @[@"排行榜",@"营养早餐",@"发布菜谱",@"晒一晒"]
#define kTagItem 1500

@implementation ItemsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addItems];
    }
    return self;
}

//添加排行榜 营养早餐 发布菜谱 晒一晒
-(void)addItems
{
    CGFloat width=kScreenWidth/4;
    
    for (int i=0; i<4; i++) {
        ItemsButtonTitleTop *subItem=[[ItemsButtonTitleTop alloc] init];
        [subItem setTitle:kItemsName[i] forState:UIControlStateNormal];
        [subItem setImage:[UIImage imageNamed:kItemsIcon[i]] forState:UIControlStateNormal];
        subItem.frame=CGRectMake(width*i, 0, width, self.frame.size.height);
        subItem.backgroundColor=[UIColor whiteColor];
        subItem.tag=kTagItem+i;
        [subItem addTarget:self action:@selector(subItemClick:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:subItem];
    }
    
}

#pragma mark 点击事件
-(void)subItemClick:(UIButton *)btn
{
    switch (btn.tag-kTagItem) {
            //排行榜
        case 0:
            if (_rankingListOperation) {
                _rankingListOperation();
            }
            break;
            //营养早餐
        case 1:
            if (_nutritionTableOpeartion) {
                _nutritionTableOpeartion();
            }
            break;
            //发布菜谱
        case 2:
            if (_sendMenuOpeartion) {
                _sendMenuOpeartion();
            }
            break;
            //晒一晒
        case 3:
            if (_baskOpeartion) {
                _baskOpeartion();
            }
            break;
        default:
            break;
    }
}

@end
