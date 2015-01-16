//
//  Stuff.h
//  Cookbook
//
//  Created by chengfang on 14-11-28.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stuff : NSObject

@property (copy,nonatomic) NSString *sid;
@property (copy,nonatomic) NSString *name;
@property (copy,nonatomic) NSString *type;
@property (copy,nonatomic) NSString *weight;

+(id)initWithDic:(NSDictionary *)dic;

@end
