//
//  Comment.h
//  Cookbook
//
//  Created by chengfang on 14-12-2.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comment : NSObject

@property (copy,nonatomic) NSString *avatar;
@property (copy,nonatomic) NSString *content;
@property (copy,nonatomic) NSString *createTime;
@property (assign,nonatomic) NSInteger userId;
@property (copy,nonatomic) NSString *userName;

+(id)initWithDic:(NSDictionary *)dic;

@end
