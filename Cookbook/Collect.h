//
//  Collect.h
//  Cookbook
//
//  Created by chengfang on 14-11-26.
//  Copyright (c) 2014年 Claire. All rights reserved.
//  菜谱专辑的数据

#import <Foundation/Foundation.h>

@interface Collect : NSObject

@property (assign,nonatomic) NSInteger cid;
@property (copy,nonatomic) NSString *content;
@property (copy,nonatomic) NSString *cover;
@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *userName;

+(id)initWithDic:(NSDictionary *)dic;

@end
