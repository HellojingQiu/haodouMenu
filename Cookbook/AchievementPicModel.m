//
//  AchievementPicModel.m
//  Cookbook
//
//  Created by chengfang on 14-12-8.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "AchievementPicModel.h"

@implementation AchievementPicModel

+(id)initWithAchievementDic:(NSDictionary *)dic
{
    AchievementPicModel *model=[[self alloc] init];
    model.comment=dic[@"Comment"];
    model.createTime=dic[@"CreateTime"];
    model.photoUrl=dic[@"PhotoUrl"];
    model.recipeId=[dic[@"RecipeId"] integerValue];
    model.recipePhotoId=[dic[@"RecipePhotoId"] integerValue];
    model.title=dic[@"Title"];
    return model;
}

@end
