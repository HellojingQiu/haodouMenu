//
//  Tag.m
//  Cookbook
//
//  Created by chengfang on 14-11-26.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "Tag.h"

@implementation Tag

+(id)initWithDic:(NSDictionary *)dic
{
    Tag *tag=[[Tag alloc] init];
    if (dic) {
        tag.tagId=dic[@"Id"];
        tag.name=dic[@"Name"];
    }
    return tag;
}
@end
