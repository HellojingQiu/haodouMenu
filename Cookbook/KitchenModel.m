//
//  KitchenModel.m
//  Cookbook
//
//  Created by chengfang on 14-11-30.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "KitchenModel.h"

@implementation KitchenModel

+(id)initWithDic:(NSDictionary *)dic
{
    KitchenModel *model=[[self alloc] init];
    model.content=dic[@"Content"];
    model.image=dic[@"Image"];
    model.title=dic[@"Title"];
    model.url=dic[@"Url"];
    return model;
}

@end
