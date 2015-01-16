//
//  Steps.h
//  Cookbook
//
//  Created by chengfang on 14-12-2.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Steps : NSObject

@property (copy,nonatomic) NSString *intro;
@property (copy,nonatomic) NSString *stepPhoto;

+(id)initWithDic:(NSDictionary *)dic;

@end
