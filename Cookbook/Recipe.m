//
//  Recipe.m
//  Cookbook
//
//  Created by chengfang on 14-11-26.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "Recipe.h"

@implementation Recipe

+(id)initWithDic:(NSDictionary *)dic
{
    Recipe *recipe=[[Recipe alloc] init];
    if (dic) {
        recipe.cover=dic[@"Cover"];
        recipe.rid=[dic[@"Rid"] integerValue];
        recipe.title=dic[@"Title"];
        recipe.userName=dic[@"UserName"];
    }
    return recipe;
}

@end
