//
//  Tag.h
//  Cookbook
//
//  Created by chengfang on 14-11-26.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tag : NSObject

@property (copy,nonatomic) NSString *tagId;
@property (copy,nonatomic) NSString *name;

+(id)initWithDic:(NSDictionary *)dic;

@end
