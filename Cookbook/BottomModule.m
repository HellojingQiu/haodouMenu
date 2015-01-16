//
//  BottomModule.m
//  Cookbook
//
//  Created by chengfang on 14-11-29.
//  Copyright (c) 2014年 Claire. All rights reserved.
//
/*
 type =1 链接地址
 type =3 json数据地址
 */
#import "BottomModule.h"

@implementation BottomModule

+(id)initWithDic:(NSDictionary *)dic
{
    BottomModule *bottomModule=[[self alloc] init];
    bottomModule.image=dic[@"Image"];
    bottomModule.title=dic[@"Title"];
    bottomModule.type=[dic[@"Type"] integerValue];
    bottomModule.url=dic[@"Url"];
    
    return bottomModule;
}

@end
