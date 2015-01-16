//
//  MenuSpecial.m
//  Cookbook
//
//  Created by chengfang on 14-12-1.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "MenuSpecial.h"

@implementation MenuSpecial

+(id)initWithDic:(NSDictionary *)dic
{
    MenuSpecial *menuS=[[self alloc] init];
    menuS.avatar=dic[@"Avatar"];
    menuS.cover=dic[@"Cover"];
    menuS.rid=[dic[@"Id"] integerValue];
    menuS.recipeCount=[dic[@"RecipeCount"] integerValue];
    menuS.title=dic[@"Title"];
    menuS.userId=[dic[@"UserId"] integerValue];
    menuS.userName=dic[@"UserName"];
    return menuS;
}

@end
