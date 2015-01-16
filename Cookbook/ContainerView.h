//
//  ContainerView.h
//  Cookbook
//
//  Created by chengfang on 14-11-27.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BottomModelFrame,Wiki,Collect;
@interface ContainerView : UIView

@property (strong,nonatomic) BottomModelFrame *bottomframe;

//查看全部菜谱
@property (copy,nonatomic) void(^checkAllMenu)();
//查看全部厨房宝典
@property (copy,nonatomic) void(^checkAllKitchenBook)();
//点击厨房宝典单元格跳转网站
@property (copy,nonatomic) void(^showDetial)(id model);
@end
