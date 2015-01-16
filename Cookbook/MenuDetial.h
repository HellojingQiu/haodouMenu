//
//  MenuDetial.h
//  Cookbook
//
//  Created by chengfang on 14-12-2.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AdData,MenuIfo;
@interface MenuDetial : NSObject

//广告数据
@property (strong,nonatomic) AdData *adData;
//是否加入广告
@property (assign,nonatomic,getter = isAdflag) BOOL adflag;
//评论
@property (strong,nonatomic) NSArray *commentArray;
//详细信息
@property (strong,nonatomic) MenuIfo *info;

+(id)initWithDic:(NSDictionary *)dic;

@end
