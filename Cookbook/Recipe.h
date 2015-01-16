//
//  Recipe.h
//  Cookbook
//
//  Created by chengfang on 14-11-26.
//  Copyright (c) 2014年 Claire. All rights reserved.
//  顶部图片滚动Model

#import <Foundation/Foundation.h>

@interface Recipe : NSObject

@property (copy,nonatomic) NSString *cover;
@property (assign,nonatomic) NSInteger rid;
@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *userName;

+(id)initWithDic:(NSDictionary *)dic;

@end
