//
//  UserInfo.m
//  Cookbook
//
//  Created by chengfang on 14-12-5.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

+(id)initWithDic:(NSDictionary *)dic
{
    UserInfo *userInfo=[[self alloc] init];
    userInfo.avatar=dic[@"Avatar"];
    userInfo.canFollow=[dic[@"CanFollow"] integerValue];
    userInfo.checkIn=[dic[@"CheckIn"] integerValue];
    userInfo.fansCount=[dic[@"FansCount"] integerValue];
    userInfo.favoriteCnt=[dic[@"FavoriteCnt"] integerValue];
    userInfo.followCnt=[dic[@"FollowCnt"] integerValue];
    userInfo.intro=dic[@"Intro"];
    userInfo.messageCnt=[dic[@"MessageCnt"] integerValue];
    userInfo.noticeCnt=[dic[@"NoticeCnt"] integerValue];
    userInfo.photoCnt=[dic[@"PhotoCnt"] integerValue];
    userInfo.recipeCnt=[dic[@"RecipeCnt"] integerValue];
    userInfo.userName=dic[@"UserName"];
    userInfo.vip=dic[@"Vip"];
    userInfo.wealth=[dic[@"Wealth"] integerValue];
    return userInfo;
}

@end
