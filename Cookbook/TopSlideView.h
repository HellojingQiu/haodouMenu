//
//  TopSlideView.h
//  Cookbook
//
//  Created by chengfang on 14-11-26.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Recipe;
@interface TopSlideView : UIView<UIScrollViewDelegate>

@property (strong,nonatomic) NSArray *dataArray;

@property (copy,nonatomic) void (^topSlideView)(Recipe *);

@end
