//
//  ItemsView.h
//  Cookbook
//
//  Created by chengfang on 14-11-27.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemsView : UIView

//排行榜
@property (copy,nonatomic) void(^rankingListOperation)();
//营养餐桌
@property (copy,nonatomic) void(^nutritionTableOpeartion)();
//发布菜谱
@property (copy,nonatomic) void(^sendMenuOpeartion)();
//晒一晒
@property (copy,nonatomic) void(^baskOpeartion)();

@end
