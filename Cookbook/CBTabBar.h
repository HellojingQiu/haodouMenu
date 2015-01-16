//
//  CBTabBar.h
//  Cookbook
//
//  Created by chengfang on 14-11-25.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBTabBar : UIImageView

-(void)addTabBarItemWithIcon:(NSString *)iconName title:(NSString *)title;

-(void)addTabBarItemWithIcon:(NSString *)iconName;

@property (nonatomic,copy) void(^itemClickBlock)(int tag);

@end
