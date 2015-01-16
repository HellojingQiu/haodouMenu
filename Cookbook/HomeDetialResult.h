//
//  HomeDetialResult.h
//  Cookbook
//
//  Created by chengfang on 14-11-28.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeDetialResult : NSObject

@property (assign,nonatomic) int count;
@property (strong,nonatomic) NSArray *items;

+(id)initWithDic:(NSDictionary *)dic;

@end
