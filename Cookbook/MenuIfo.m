//
//  MenuIfo.m
//  Cookbook
//
//  Created by chengfang on 14-12-2.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "MenuIfo.h"
#import "StuffDetial.h"
#import "Steps.h"
#import "Tag.h"
@implementation MenuIfo

+(id)initWithDic:(NSDictionary *)dic
{
    MenuIfo *info=[[self alloc] init];
    info.avatar=dic[@"Avatar"];
    info.commentCount=[dic[@"CommentCount"] integerValue];
    info.cookTime=dic[@"CookTime"];
    info.cover=dic[@"Cover"];
    info.favoriteCount=[dic[@"FavoriteCount"] integerValue];
    info.intro=dic[@"Intro"];
    info.isFavorited=[dic[@"IsFavorited"] boolValue];
    
    //主要材料
    NSArray *mainStuff=dic[@"MainStuff"];
    NSMutableArray *mainSuffTemp=[NSMutableArray array];
    for (int i=0; i<mainStuff.count; i++) {
        StuffDetial *sd=[StuffDetial initWithDic:mainStuff[i]];
        [mainSuffTemp addObject:sd];
    }
    info.mainStuff=mainSuffTemp;
    
    //其他材料
    NSArray *ohterStuff=dic[@"OtherStuff"];
    NSMutableArray *ohterStuffTemp=[NSMutableArray array];
    for (int i=0; i<ohterStuff.count; i++) {
        StuffDetial *sd=[StuffDetial initWithDic:ohterStuff[i]];
        [ohterStuffTemp addObject:sd];
    }
    info.otherStuff=ohterStuffTemp;
    
    info.photoCount=[dic[@"PhotoCount"] integerValue];
    info.photoList=dic[@"PhotoList"];
    info.readyTime=dic[@"ReadyTime"];
    info.recipeld=[dic[@"RecipeId"] integerValue];
    info.reviewTime=dic[@"ReviewTime"];
    
    //步骤
    NSArray *setps=dic[@"Steps"];
    NSMutableArray *stepsTemp=[NSMutableArray array];
    for (int i=0; i<setps.count; i++) {
        Steps *step=[Steps initWithDic:setps[i]];
        [stepsTemp addObject:step];
    }
    info.steps=stepsTemp;
    
    //全部材料
    NSArray *allStuff=dic[@"Stuff"];
    NSMutableArray *allStuffTemp=[NSMutableArray array];
    for (int i=0; i<allStuff.count; i++) {
        StuffDetial *sd=[StuffDetial initWithDic:allStuff[i]];
        [allStuffTemp addObject:sd];
    }
    info.stuff=allStuffTemp;
    
    //标签
    NSArray *tags=dic[@"Tags"];
    NSMutableArray *tagsTemp=[NSMutableArray array];
    for (int i=0; i<tags.count; i++) {
        Tag *tag=[Tag initWithDic:tags[i]];
        [tagsTemp addObject:tag];
    }
    info.tags=tagsTemp;
    
    info.tips=dic[@"Tips"];
    info.title=dic[@"Title"];
    info.type=[dic[@"Type"] integerValue];
    info.userCount=dic[@"UserCount"];
    info.userId=[dic[@"UserId"] integerValue];
    info.userName=dic[@"UserName"];
    info.viewCount=[dic[@"ViewCount"] integerValue];
    return info;
}

@end
