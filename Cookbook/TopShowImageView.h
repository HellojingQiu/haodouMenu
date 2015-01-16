//
//  TopShowImageView.h
//  Cookbook
//
//  Created by chengfang on 14-11-26.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Recipe;
@interface TopShowImageView : UIImageView

@property (strong,nonatomic) Recipe *recipe;

@property (copy,nonatomic) void(^imageViewClick)(Recipe *);

@end
