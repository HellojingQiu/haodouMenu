//
//  Result.h
//  Cookbook
//
//  Created by chengfang on 14-11-26.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Result : NSObject

@property (strong,nonatomic) NSDictionary *adData;
@property (assign,nonatomic) float adFlag;
@property (strong,nonatomic) NSArray *collectList;
@property (strong,nonatomic) NSArray *recipeList;
@property (strong,nonatomic) NSArray *tagList;
@property (strong,nonatomic) NSArray *wikiList;
@property (assign,nonatomic) float status;

+(id)initWithDic:(NSDictionary *)dic;

@end
