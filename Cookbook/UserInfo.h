//
//  UserInfo.h
//  Cookbook
//
//  Created by chengfang on 14-12-5.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

//头像
@property (copy,nonatomic) NSString *avatar;

@property (assign,nonatomic,getter = isCanFollow) BOOL canFollow;
@property (assign,nonatomic,getter = isCheckIn) BOOL checkIn;
//粉丝数
@property (assign,nonatomic) NSInteger fansCount;

@property (assign,nonatomic) NSInteger favoriteCnt;
//关注数
@property (assign,nonatomic) NSInteger followCnt;

@property (copy,nonatomic) NSString *intro;

@property (assign,nonatomic) NSInteger messageCnt;

@property (assign,nonatomic) NSInteger noticeCnt;

//成果照
@property (assign,nonatomic) NSInteger photoCnt;

//菜谱数量
@property (assign,nonatomic) NSInteger recipeCnt;

@property (copy,nonatomic) NSString *userName;

//Vip等级
@property (copy,nonatomic) NSString *vip;

//访客暂时不需要Vistor

//财富值
@property (assign,nonatomic) NSInteger wealth;

+(id)initWithDic:(NSDictionary *)dic;

@end
