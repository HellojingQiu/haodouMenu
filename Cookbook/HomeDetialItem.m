//
//  HomeDetialItem.m
//  Cookbook
//
//  Created by chengfang on 14-11-28.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "HomeDetialItem.h"
#import "Stuff.h"
@implementation HomeDetialItem

+(id)initWithDic:(NSDictionary *)dic
{
    HomeDetialItem *item=[[self alloc] init];
    
    item.avatar=dic[@"Avatar"];
    item.commentCount=[dic[@"CommentCount"] integerValue];
    item.cover=dic[@"Cover"];
    item.favoriteCount=[dic[@"FavoriteCount"] integerValue];
    item.intro=dic[@"Intro"];
    item.recipeId=[dic[@"RecipeId"] integerValue];
    
    NSArray *tempArray=dic[@"Stuff"];
    NSMutableArray *dataArray=[NSMutableArray array];
    for (int i=0; i<tempArray.count; i++) {
        Stuff *stuff=[Stuff initWithDic:tempArray[i]];
        [dataArray addObject:stuff];
    }
    item.stuffs=[NSArray arrayWithArray:dataArray];
    item.title=dic[@"Title"];
    item.userId=[dic[@"UserId"] integerValue];
    item.userName=dic[@"UserName"];
    item.viewCount=[dic[@"ViewCount"] integerValue];
    return item;
}

@end
