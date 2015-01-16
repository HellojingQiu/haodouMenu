//
//  RankUserInfo.h
//  Cookbook
//
//  Created by chengfang on 14-12-4.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RankUserInfo : NSObject

@property (assign,nonatomic,getter = isVip) BOOL vip;
@property (assign,nonatomic) NSInteger recipeid;
@property (copy,nonatomic) NSString *title;
@property (assign,nonatomic) NSInteger userId;
@property (copy,nonatomic) NSString *userName;
@property (assign,nonatomic) NSInteger viewCount;

+(id)initWithDic:(NSDictionary *)dic;

@end
