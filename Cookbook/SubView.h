//
//  SubView.h
//  Cookbook
//
//  Created by chengfang on 14-12-3.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MenuViewModel,SubView;

@protocol SubViewDelegate <NSObject>

-(void)subViewClick:(SubView *)subView model:(MenuViewModel *)model;

@end

@interface SubView : UIView

@property (strong,nonatomic) MenuViewModel *menuModel;

@property (assign,nonatomic) id<SubViewDelegate> delegate;

@end
