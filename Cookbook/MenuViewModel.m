//
//  MenuViewModel.m
//  Cookbook
//
//  Created by chengfang on 14-12-3.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "MenuViewModel.h"

@implementation MenuViewModel

+(id)initWithDic:(NSDictionary *)dic
{
    MenuViewModel *model=[[self alloc] init];
    model.cover=dic[@"Cover"];
    model.rid=[dic[@"Rid"] integerValue];
    model.title=dic[@"Title"];
    return model;
}

@end
