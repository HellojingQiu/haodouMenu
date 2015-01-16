//
//  ImageButton.h
//  Cookbook
//
//  Created by chengfang on 14-11-30.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BottomModule;
@interface ImageButton : UIView

@property (strong,nonatomic) BottomModule *bottomModule;
//点击事件处理
@property (copy,nonatomic) void(^operation)(BottomModule *);

@end
