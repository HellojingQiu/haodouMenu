//
//  FansInfo.h
//  Cookbook
//
//  Created by chengfang on 14-12-5.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FansInfo : NSObject

@property (copy,nonatomic) NSString *avatar;
@property (assign,nonatomic) NSInteger userId;
@property (copy,nonatomic) NSString *userName;
@property (copy,nonatomic) NSString *vip;

+(id)initWithDic:(NSDictionary *)dic;

@end
