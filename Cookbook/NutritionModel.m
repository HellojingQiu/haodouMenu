//
//  NutritionModel.m
//  Cookbook
//
//  Created by chengfang on 14-12-1.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "NutritionModel.h"

@implementation NutritionModel

+(id)initWithDic:(NSDictionary *)dic
{
    NutritionModel *nutModel=[[self alloc] init];
    nutModel.content=dic[@"Content"];
    nutModel.image=dic[@"Image"];
    nutModel.title=dic[@"Title"];
    nutModel.url=dic[@"Url"];
    return nutModel;
}

@end
