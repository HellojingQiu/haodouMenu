//
//  ShakeModel.h
//  Cookbook
//
//  Created by chengfang on 14-11-29.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShakeModel : NSObject

@property (copy,nonatomic) NSString *cover;
@property (assign,nonatomic) NSInteger sid;
@property (copy,nonatomic) NSString *stuff;
@property (copy,nonatomic) NSString *title;

+(id)initWithDic:(NSDictionary *)dic;

@end
