//
//  ShakeModel.m
//  Cookbook
//
//  Created by chengfang on 14-11-29.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "ShakeModel.h"

@implementation ShakeModel

+(id)initWithDic:(NSDictionary *)dic
{
    ShakeModel *shakeModel=[[self alloc] init];
    shakeModel.cover=dic[@"Cover"];
    shakeModel.sid=[dic[@"Id"] integerValue];
    shakeModel.stuff=dic[@"Stuff"];
    shakeModel.title=dic[@"Title"];
    
    return shakeModel;
}

@end
