//
//  AdData.m
//  Cookbook
//
//  Created by chengfang on 14-12-2.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "AdData.h"

@implementation AdData

+(id)initWithDic:(NSDictionary *)dic
{
    AdData *adData=[[self alloc] init];
    adData.image=dic[@"Image"];
    adData.title=dic[@"Title"];
    adData.url=dic[@"Url"];
    return adData;
}

@end
