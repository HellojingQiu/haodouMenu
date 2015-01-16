//
//  Wiki.h
//  Cookbook
//
//  Created by chengfang on 14-11-26.
//  Copyright (c) 2014年 Claire. All rights reserved.
//  厨房宝典下面数据

#import <Foundation/Foundation.h>

@interface Wiki : NSObject

@property (copy,nonatomic) NSString *content;
@property (copy,nonatomic) NSString *cover;
@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *url;
@property (copy,nonatomic) NSString *userName;

+(id)initWithDic:(NSDictionary *)dic;

@end
