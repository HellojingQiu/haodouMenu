//
//  FansInfo.m
//  Cookbook
//
//  Created by chengfang on 14-12-5.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "FansInfo.h"

@implementation FansInfo

+(id)initWithDic:(NSDictionary *)dic
{
    FansInfo *fans=[[self alloc] init];
    fans.avatar=dic[@"Avatar"];
    fans.userId=[dic[@"UserId"] integerValue];
    fans.userName=dic[@"UserName"];
    fans.vip=dic[@"Vip"];
    return fans;
}

@end
