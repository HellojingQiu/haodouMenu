//
//  MenuDetialView.h
//  Cookbook
//
//  Created by chengfang on 14-12-2.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MenuDetialViewFrame,AdData,Tag;
@interface MenuDetialView : UIView

@property (strong,nonatomic) MenuDetialViewFrame *menuDetialFrame;

@property (copy,nonatomic) void(^adData)(AdData *);

@property (copy,nonatomic) void(^tagOpeartion)(Tag *);

@property (copy,nonatomic) void(^watchMoreOpeartion)(NSInteger rid);

@property (copy,nonatomic) void(^showUserInfoOpeartion)(NSInteger userId,NSString *userName);

@end
