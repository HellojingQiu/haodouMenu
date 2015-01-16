//
//  RankUserInfo.m
//  Cookbook
//
//  Created by chengfang on 14-12-4.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "RankUserInfo.h"

@implementation RankUserInfo

+(id)initWithDic:(NSDictionary *)dic
{
    RankUserInfo *rui=[[self alloc] init];
    
    rui.vip=[dic[@"IsVip"] boolValue];
    rui.recipeid=[dic[@"RecipeId"] integerValue];
    rui.title=dic[@"Title"];
    rui.userId=[dic[@"UserId"] integerValue];
    rui.userName=dic[@"UserName"];
    rui.viewCount=[dic[@"ViewCount"] integerValue];
    
    return rui;
}
@end
