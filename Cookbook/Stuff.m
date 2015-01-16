//
//  Stuff.m
//  Cookbook
//
//  Created by chengfang on 14-11-28.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "Stuff.h"

@implementation Stuff

+(id)initWithDic:(NSDictionary *)dic
{
    Stuff *stuff=[[self alloc] init];
    
    stuff.sid=dic[@"id"];
    stuff.name=dic[@"name"];
    stuff.type=dic[@"type"];
    stuff.weight=dic[@"weight"];
    return stuff;
}

@end
