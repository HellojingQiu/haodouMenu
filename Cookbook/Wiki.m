//
//  Wiki.m
//  Cookbook
//
//  Created by chengfang on 14-11-26.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "Wiki.h"

@implementation Wiki

+(id)initWithDic:(NSDictionary *)dic
{
    Wiki *wiki=[[Wiki alloc] init];
    if (dic) {
        wiki.content=dic[@"Content"];
        wiki.cover=dic[@"Cover"];
        wiki.title=dic[@"Title"];
        wiki.url=dic[@"Url"];
        wiki.userName=dic[@"UserName"];

//        //使用KVC
//        [wiki.content setValue:dic[@"Content"] forKey:@"Content"];
//        [wiki.cover setValue:dic[@"Cover"] forKey:@"Cover"];
//        [wiki.title setValue:dic[@"Title"] forKey:@"Title"];
//        [wiki.url setValue:dic[@"Url"] forKey:@"Url"];
//        [wiki.userName setValue:dic[@"UserName"] forKey:@"UserName"];
    }
    return wiki;
}

@end
