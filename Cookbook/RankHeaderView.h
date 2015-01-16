//
//  RankHeaderView.h
//  Cookbook
//
//  Created by chengfang on 14-12-9.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RankHeaderView;
@protocol RankHeaderViewDelegate <NSObject>

-(void)rankHeaderViewDidSelected:(RankHeaderView *)rankHeaderView;

@end

@interface RankHeaderView : UIView

@property (strong,nonatomic) UILabel *titleLabel;

@property (assign,nonatomic) BOOL hide;

@property (weak,nonatomic) id<RankHeaderViewDelegate> delegate;

@end
