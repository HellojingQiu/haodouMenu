//
//  StuffDetial.m
//  Cookbook
//
//  Created by chengfang on 14-12-2.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "StuffDetial.h"

@implementation StuffDetial

+(id)initWithDic:(NSDictionary *)dic
{
    StuffDetial *stuff=[[self alloc] init];
    stuff.cate=dic[@"cate"];
    stuff.cateId=[dic[@"cateid"] integerValue];
    stuff.cid=[dic[@"id"] integerValue];
    stuff.name=dic[@"name"];
    stuff.type=[dic[@"type"] integerValue];
    stuff.weight=dic[@"weight"];
    return stuff;
}

@end
