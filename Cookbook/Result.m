//
//  Result.m
//  Cookbook
//
//  Created by chengfang on 14-11-26.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "Result.h"
#import "Collect.h"
#import "Recipe.h"
#import "Wiki.h"
#import "Tag.h"
@implementation Result

+(id)initWithDic:(NSDictionary *)dic
{
    Result *result=[[Result alloc] init];
    
    if (dic) {
        result.adData=dic[@"ad_data"];
        result.adFlag=[dic[@"ad_flag"] floatValue];
        
        NSMutableArray *tempCollectList=[NSMutableArray array];
        if (dic[@"collect_list"]) {
            NSArray *array=dic[@"collect_list"];
            for (int i=0; i<array.count; i++) {
                [tempCollectList addObject:[Collect initWithDic:array[i]]];
            }
            result.collectList=[NSArray arrayWithArray:tempCollectList];
        }
        
        NSMutableArray *tempRecipeLit=[NSMutableArray array];
        if (dic[@"recipe_list"]) {
            NSArray *array=dic[@"recipe_list"];
            for (int i=0; i<array.count; i++) {
                [tempRecipeLit addObject:[Recipe initWithDic:array[i]]];
            }
            result.recipeList=[NSArray arrayWithArray:tempRecipeLit];
        }
        
        NSMutableArray *tempTagList=[NSMutableArray array];
        if (dic[@"tag_list"]) {
            NSArray *array=dic[@"tag_list"];
            for (int i=0; i<array.count; i++) {
                [tempTagList addObject:[Tag initWithDic:array[i]]];
            }
            result.tagList=[NSArray arrayWithArray:tempTagList];
        }
        
        NSMutableArray *tempWikiList=[NSMutableArray array];
        if (dic[@"wiki_list"]) {
            NSArray *array=dic[@"wiki_list"];
            for (int i=0; i<array.count; i++) {
                [tempWikiList addObject:[Wiki initWithDic:array[i]]];
            }
            result.wikiList=[NSArray arrayWithArray:tempWikiList];
        }
    }
    
    return result;
}

@end
