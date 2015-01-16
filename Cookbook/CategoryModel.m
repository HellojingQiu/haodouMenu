//
//  CategoryModel.m
//  Cookbook
//
//  Created by chengfang on 14-11-29.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "CategoryModel.h"
#import "Tag.h"

@implementation CategoryModel

+(id)initWithDic:(NSDictionary *)dic
{
    CategoryModel *category=[[self alloc] init];
    category.cate=dic[@"Cate"];
    category.imageUrl=dic[@"ImgUrl"];
    NSArray *array=dic[@"Tags"];
    NSMutableArray *tempArray=[NSMutableArray array];
    for (int i=0; i<array.count; i++) {
        Tag *tag=[Tag initWithDic:array[i]];
        [tempArray addObject:tag];
    }
    category.tags=tempArray;
    return category;
}

@end
