//
//  StrollSubView.h
//  Cookbook
//
//  Created by chengfang on 14-11-30.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BottomModule;
@interface StrollSubView : UIView

@property (strong,nonatomic) NSArray *dataArray;
//用来判断奇偶数 大图在前还是大图在后
@property (assign,nonatomic) NSInteger index;

//点击事件处理
@property (copy,nonatomic) void(^operation)(BottomModule *);

@end
