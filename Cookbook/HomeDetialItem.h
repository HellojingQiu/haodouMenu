//
//  HomeDetialItem.h
//  Cookbook
//
//  Created by chengfang on 14-11-28.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeDetialItem : NSObject

@property (copy,nonatomic) NSString *avatar;
@property (assign,nonatomic) NSInteger commentCount;
@property (copy,nonatomic) NSString *cover;
@property (assign,nonatomic) NSInteger favoriteCount;
@property (copy,nonatomic) NSString *intro;
@property (assign,nonatomic) NSInteger recipeId;
@property (strong,nonatomic) NSArray *stuffs;
@property (copy,nonatomic) NSString *title;
@property (assign,nonatomic) NSInteger userId;
@property (copy,nonatomic) NSString *userName;
@property (assign,nonatomic) NSInteger viewCount;

+(id)initWithDic:(NSDictionary *)dic;

@end
