//
//  Collect.m
//  Cookbook
//
//  Created by chengfang on 14-11-26.
//  Copyright (c) 2014年 Claire. All rights reserved.
//  

#import "Collect.h"

@implementation Collect

+(id)initWithDic:(NSDictionary *)dic
{
    Collect *collect=[[Collect alloc] init];
    if (dic) {
        
        collect.cid=[dic[@"Cid"] integerValue];
        collect.content=dic[@"Content"];
        collect.cover=dic[@"Cover"];
        collect.title=dic[@"Title"];
        collect.userName=dic[@"UserName"];
        
//        //使用KVC
//        [collect.cid setValue:dic[@"Cid"] forKey:@"Cid"];
//        [collect.content setValue:dic[@"Content"] forKey:@"Content"];
//        [collect.cover setValue:dic[@"Cover"] forKey:@"Cover"];
//        [collect.title setValue:dic[@"Title"] forKey:@"Title"];
//        [collect.userName setValue:dic[@"UserName"] forKey:@"UserName"];
    }
    return collect;
}

@end
