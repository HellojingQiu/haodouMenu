//
//  RankModel.m
//  Cookbook
//
//  Created by chengfang on 14-12-4.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "RankModel.h"
#import "RankUserInfo.h"
@implementation RankModel

+(id)initWithDic:(NSDictionary *)dic
{
    RankModel *rankModel=[[self alloc] init];
    rankModel.tagId=[dic[@"TagId"] integerValue];
    rankModel.title=dic[@"Title"];
    NSArray *tempArray=dic[@"Recipe"];
    NSMutableArray *array=[NSMutableArray array];
    for (int i=0; i<tempArray.count; i++) {
        RankUserInfo *user=[RankUserInfo initWithDic:tempArray[i]];
        [array addObject:user];
    }
    rankModel.recipes=array;
    return rankModel;
}

@end
