//
//  StuffDetial.h
//  Cookbook
//
//  Created by chengfang on 14-12-2.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StuffDetial : NSObject

@property (copy,nonatomic) NSString *cate;
@property (assign,nonatomic) NSInteger cateId;
@property (assign,nonatomic) NSInteger cid;
@property (copy,nonatomic) NSString *name;
@property (assign,nonatomic) NSInteger type;
@property (copy,nonatomic) NSString *weight;

+(id)initWithDic:(NSDictionary *)dic;

@end
