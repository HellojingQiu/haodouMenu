//
//  MenuDetialViewFrame.h
//  Cookbook
//
//  Created by chengfang on 14-12-2.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MenuDetial;

@interface MenuDetialViewFrame : NSObject
//菜谱名
@property (assign,nonatomic) CGRect titleFrame;

//头像
@property (assign,nonatomic) CGRect avatarFrame;

//用户名
@property (assign,nonatomic) CGRect userNameFrame;

//发布时间
@property (assign,nonatomic) CGRect reviewTimeFrame;

//描述
@property (assign,nonatomic) CGRect introFrame;

//材料
@property (assign,nonatomic) CGRect stuffViewFrame;

//制作时间和用餐人数
@property (assign,nonatomic) CGRect cookTimeViewFrame;

//步骤文字查看更多
@property (assign,nonatomic) CGRect watchBigImageBtnFrame;

//分割线
@property (assign,nonatomic) CGRect lineImageFrame;

//步骤图
@property (assign,nonatomic) CGRect setpViewFrame;

//小贴士文本
@property (assign,nonatomic) CGRect tipsLabelFrame;

//小贴士下面分割线
@property (assign,nonatomic) CGRect tipsLineFrame;

//小贴士详细
@property (assign,nonatomic) CGRect tipsDetialFrame;

//广告位
@property (assign,nonatomic) CGRect adDataViewFrame;

//评论标题
@property (assign,nonatomic) CGRect commentLabelFrame;

//评论分割线
@property (assign,nonatomic) CGRect commentLineFrame;

//评论详情
@property (assign,nonatomic) CGRect commentViewFrame;

//查看更多评论
@property (assign,nonatomic) CGRect watchMoreBtnFrame;

//相关标签
@property (assign,nonatomic) CGRect tagLabelFrame;

//相关标签
@property (assign,nonatomic) CGRect aboutTagsFrame;

//发布我的成果照
@property (assign,nonatomic) CGRect sendMyPicFrame;

//有疑问,私信作者
@property (assign,nonatomic) CGRect lastLabelFrame;

@property (strong,nonatomic) MenuDetial *menuDetial;

-(CGFloat)getMaxHeight;

@end
