//
//  HomeDetialResult.m
//  Cookbook
//
//  Created by chengfang on 14-11-28.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "HomeDetialResult.h"
#import "HomeDetialItem.h"
@implementation HomeDetialResult

+(id)initWithDic:(NSDictionary *)dic
{
    HomeDetialResult *result=[[self alloc] init];
    result.count=[dic[@"count"] integerValue];
    
    NSArray *tempArray=dic[@"list"];
    NSMutableArray *dataArray=[NSMutableArray array];
    for (int i=0; i<tempArray.count; i++) {
        HomeDetialItem *item=[HomeDetialItem initWithDic:tempArray[i]];
        [dataArray addObject:item];
    }
    result.items=[NSArray arrayWithArray:dataArray];
    return result;
}

@end
