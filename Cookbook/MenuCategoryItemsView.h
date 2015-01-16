//
//  MenuCategoryItemsView.h
//  Cookbook
//
//  Created by chengfang on 14-11-27.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuCategoryItemsView : UIView

@property (strong,nonatomic) NSArray *tagArray;

@property (copy,nonatomic) void(^categoryItemBtnBlock)(int tag);

@end
